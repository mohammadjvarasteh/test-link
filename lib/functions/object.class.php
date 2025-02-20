<?php
/** 
 * TestLink Open Source Project - http://testlink.sourceforge.net/ 
 * This script is distributed under the GNU General Public License 2 or later. 
 *
 * @filesource  object.class.php
 * @package     TestLink
 * @copyright   2007-2020, TestLink community 
 * @link        http://www.testlink.org
 *
 **/
 
/** 
 * Namespace for TestLink, here we can safely define constants and other stuff, 
 * without risk of collision with other stuff
 * 
 * @package   TestLink
 * @abstract 
 */
abstract class tl
{
  /**
   * error and status codes:
   * all SUCCESS error codes and SUCCESS status codes should be greater than tl::OK 
   * so we can check for SUCCESS with >= tl::OK, and for ERROR with < tl::OK
   */
  const OK = 1;

  /** 
   * error and status codes:
   * all ERROR error codes and ERROR status codes should be lesser than tl::ERROR
   * so we can check for ERRORS with <= tl::ERROR, and for SUCCESS with > tl::ERROR
   */
  const ERROR = 0;
  
  /** 
   * error and status codes:
   * return code for not implemented interface functions 
   */
  const E_NOT_IMPLEMENTED = -0xFFFFFFFF;
};


require_once('int_serialization.php');

/**
 * Base class for all managed TestLink objects, all tl-managed objects should extend this base class
 * 
 * @package   TestLink
 * @abstract 
 */
abstract class tlObject implements iSerialization
{ 
  /** @var string the unique object id */
  protected $objectID;

  /** 
   * @var string a message for user feedback 
   */
  protected $userFeedback;
    
  /**
   * @var array supported serialization interfaces
   */
  protected $serializationInterfaces;

  /**
   * @var array of format descriptors for the interfaces
   */
  protected $serializationFormatDescriptors;

  /**
   * @var array useful to manage DB where TL table names must have a prefix.
   *    key: table name WITHOUT prefix
   *    value: table name WITH PREFIX
   * @see getDBTables() 
   */
  protected $tables = null;

  /**
   * @var array useful to manage DB where TL view names must have a prefix.
   *    key: view name WITHOUT prefix
   *    value: view name WITH PREFIX
   * @see getDBViews()  
   */
  protected $views = null;

  protected $auditCfg;

  
  /** class constructor */
  public function __construct()
  {
    if (!isset($this->tables))
    {
      $this->tables = self::getDBTables();
      $this->views = self::getDBViews();
    }

    $this->objectID = str_replace(".","",uniqid("", true));
  
    $this->auditCfg = new stdClass();
    $this->auditCfg->eventSource = 'GUI';
    $this->auditCfg->logEnabled = true;
  
    /*
      Any supported import/Export Serialization Interface must be prefixed with iSerializationTo 
      so we can automatically detected the interfaces
    */
    $prefix = "iSerializationTo";
    $prefixLen = strlen($prefix);
    $o = new ReflectionObject($this);
    $interfaces = $o->getInterfaces();
    $this->serializationInterfaces = null;
    $this->serializationFormatDescriptors = null;
    if ($interfaces)
    {
      foreach($interfaces as $name => $info)
      {
        $iPos = strpos($name,$prefix);
        if ($iPos === 0)
        {
          $format = substr($name,$prefixLen);
          $this->serializationInterfaces[$name] = $format;
          $pfn = "getFormatDescriptionFor".$format;
          $this->serializationFormatDescriptors[$format] = $this->$pfn();
        }
      }
    }
    $this->getSupportedSerializationFormatDescriptions();
  }

  /**
   *
   */ 
  function setAuditLogOn()
  {
    $this->auditCfg->logEnabled = true;
  }

  /**
   *
   */ 
  function setAuditLogOff()
  {
    $this->auditCfg->logEnabled = false;
  }

  /**
   *
   */ 
  function setAuditEventSource($val)
  {
    $this->auditCfg->eventSource = $val;
  }

  /**
   * get a message for user
   */
   public function getUserFeedback()
   {
    return $this->userFeedback;
   }
  
  /**
   * Set a message for user
   * @param string $message a localized message as user feedback
   */
   public function setUserFeedback($message)
   {
    $this->userFeedback = $message;
   }
  
  /**
   * Getter for the unique objectID
   * @return string the ID of the object 
   */
  public function getObjectID()
  { 
    return $this->objectID;
  }
  
  /** class destructor */
  public function __destruct()
  {
    $this->_clean();
  }

  
  /** 
   * magic method for usage with print() or echo() , dumps out the object
   *  
   * @return string a dump of the object
   */
  public function __toString()
  {
    return __CLASS__.", ".print_r($this,true);
  }
  
  /** function used for resetting the object's internal data */
  protected function _clean()
  {
  }
  
  /** 
   * Gets all serializationInterfaces the object supports
   * 
   * @return all supported Import/Export Interfaces  
   **/
  function getSupportedSerializationInterfaces()
  {
    return $this->serializationInterfaces;
  }
  
  /** 
   * @return all supported Import/Export Interfaces - Format Descriptors 
   **/
  function getSupportedSerializationFormatDescriptions()
  {
    return $this->serializationFormatDescriptors;
  }
  
  /** 
   * should be called whenever a not implemented method is called
   * 
   * @param string name of method
   * @return integer error code "not implemented"
   **/  
  protected function handleNotImplementedMethod($fName = "<unknown>")
  {
    trigger_error("Method ".$fName." called which is not implemented",E_USER_WARNING);
    return tl::E_NOT_IMPLEMENTED;
  }


  /**
     * useful to manage DB where TL table names must have a prefix.
     *
     * @param $tableNames array of tablenames, to get only some of the tables
   * @return map key=table name without prefix, value=table name on db
   *
    */
  static public function getDBTables($tableNames = null)
  {
    $items = array( 'assignment_status',
                    'assignment_types', 
                    'attachments',
                    'baseline_l1l2_context',
                    'baseline_l1l2_details',
                    'builds',
                    'cfield_build_design_values',
                    'cfield_design_values',
                    'cfield_execution_values',
                    'cfield_node_types',
                    'cfield_testplan_design_values',
                    'cfield_testprojects',
                    'custom_fields',
                    'db_version',
                    'events',
                    'execution_bugs',
                    'execution_tcsteps',
                    'executions',
                    'inventory',
                    'issuetrackers',
                    'testproject_issuetracker',
                    'codetrackers',
                    'testproject_codetracker',
                    'keywords',
                    'milestones',
                    'node_types',
                    'nodes_hierarchy',
                    'object_keywords',
                    'platforms',
                    'plugins',
                    'plugins_configuration', 
                    'req_coverage',
                    'req_relations',
                    'req_specs',
                    'req_specs_revisions',
                    'reqmgrsystems',
                    'testproject_reqmgrsystem',
                    'requirements',
                    'req_versions',
                    'req_revisions',
                    'req_notify_assignments',
                    'req_monitor',
                    'rights',
                    'risk_assignments',
                    'role_rights',
                    'roles',
                    'testcase_relations',
                    'tcversions',
                    'tcsteps',
                    'testcase_keywords',
                    'testcase_platforms',
                    'testplan_platforms' ,
                    'testcase_script_links',
                    'testplan_tcversions' ,
                    'testplans' ,
                    'testprojects',
                    'testsuites',
                    'text_templates',
                    'transactions',
                    'user_assignments',
                    'user_group',
                    'user_group_assign',
                    'user_testplan_roles',
                    'user_testproject_roles',
                    'users',
                    'execution_tcsteps_wip' 
    ); 

    $tables = array();
    foreach($items as $tblKey) {
      $tables[$tblKey] = DB_TABLE_PREFIX . $tblKey;
    }

    if ($tableNames != null) { 
      $tableNames = (array)$tableNames;
      $tableNames = array_flip($tableNames);      
      $tables = array_intersect_key($tables,$tableNames);
      if (sizeof($tables) != sizeof($tableNames)) {
        throw new Exception("Wrong table name(s) for getDBTables() detected!");
      } 
    }
     
    return $tables;
  }

  /**
   *
   */
  static public function getDBViews($itemNames = null) 
  {
    $items = array('tcversions_last_active' => null,
                   'tcversions_without_keywords' => null,
                   'tcversions_without_platforms' => null,
                   'latest_exec_by_context' => null,
                   'latest_exec_by_testplan' => null,
                   'latest_exec_by_testplan_plat' => null,
                   'latest_tcase_version_id' => null,
                   'latest_tcase_version_number' => null,
                   'latest_req_version' => null,
                   'latest_req_version_id' => null,
                   'latest_rspec_revision' => null,
                   'tsuites_tree_depth_2' => null,
                   'exec_by_date_time' => null,
                   'exec_daily_stats' => null); 
    
    foreach($items as $key => $value) {
      $items[$key] = DB_TABLE_PREFIX . $key;
    }

    if ($itemNames != null) { 
      $itemNames = (array)$itemNames;
      $itemNames = array_flip($itemNames);      
      $items = array_intersect_key($items,$itemNames);
      if (sizeof($items) != sizeof($itemNames)) {
        $msg = "Wrong view name(s) for " . __FUNCTION__ . " detected!";
        throw new Exception($msg);
      } 
    }
    
    return $items;
  }

}


/**
 * The base class for all managed TestLink objects which need a db connection
 * 
 * @package   TestLink
 * @abstract 
 */
abstract class tlObjectWithDB extends tlObject
{ 
  /** @var resource the db connection to the testlink database */
  protected $db;
  
  /**
   * Class contructor 
   * @param object [ref] $db the database connection
   */
  function __construct(&$db)
  {
    tlObject::__construct();
    $this->db = &$db;
  }

  function setDB(&$db)
  {
    $this->db = &$db;
  }

}

/**
 * The base class for all managed TestLink objects which support attachments
 * 
 * @package   TestLink
 * @abstract 
 */
abstract class tlObjectWithAttachments extends tlObjectWithDB
{
  /** @var object the attachment repository object */
  protected $attachmentRepository;

  /** @var string the foreign key table name to store the attachements */
  protected $attachmentTableName;
  
  /**
   * Class constructor
   *  
   * @param object [ref] $db the database connection
   * @param string $attachmentTableName the foreign key table name to store the attachments
   */
  function __construct(&$db,$attachmentTableName)
  {
    tlObjectWithDB::__construct($db);
    $this->attachmentRepository = tlAttachmentRepository::create($this->db);
    $this->attachmentTableName = $attachmentTableName;
  }
  
  /**
   * gets all infos about the attachments of the object specified by $id
   *    
   * @param integer $id this is the fkid of the attachments table
     * @return array returns map with the infos of the attachment, 
     *         keys are the column names of the attachments table 
   *
   * @TODO schlundus: legacy function to keep existing code, should be replaced by a 
   *                  function which returns objects 
   */
  function getAttachmentInfos($id)
  {
    return $this->attachmentRepository->getAttachmentInfosFor($id,$this->attachmentTableName);
  }
  
  /**
   * deletes all attachments of the object specified by $id   
   *
   * @param int $id this is the fkid of the attachments table
   * @return returns tl::OK on success, else error code
   */
  function deleteAttachments($id)
  {
    return $this->attachmentRepository->deleteAttachmentsFor($id,$this->attachmentTableName);
  }
  
  /**
   *  function used for resetting the object's internal data 
   **/
  protected function _clean()
  {
    $this->attachmentRepository = null;
    $this->attachmentTableName = null;
  }
  
  function getAttachmentTableName()
  {
    return $this->attachmentTableName;  
  }
  
}


/**
 * class implement basic support for work with DB
 * 
 * @package   TestLink
 * @abstract 
 */
abstract class tlDBObject extends tlObject implements iDBSerialization
{
  /**
   * @var array this is the static object cache for all tlDBObject. objects are stored like this
   *       [classname][detailLevel][databaseID]
   */
  static protected $objectCache = null;
  
  /**
   * @var boolean activate Caching or not, default is set to false, because it all brings performance to certain 
   *        objects
   */
  protected $activateCaching = false; 
  
  /**
   * @var integer the database id of the object
   */
  public $dbID;
  
  /**
   * @var int the detail level, used to configure how much information 
   *          about the object is read from the database
   */
  protected $detailLevel;
  
  /** standard get option, all other get options must be greater than this */
  const TLOBJ_O_SEARCH_BY_ID = 1;
  
  //standard detail levels, can be used to get only some specific details when reading an object
  //to avoid unneccessary DB queries (when the info is actual not used and not needed)
  const TLOBJ_O_GET_DETAIL_MINIMUM = 0;
  
  //get all information
  const TLOBJ_O_GET_DETAIL_FULL = 0xFFFFFFFF;
  
  /** 
   * Class constructor
   *
   * @param integer $dbID (optional) the database identifier
   */
  function __construct($dbID = null)
  {
    parent::__construct();
    
    $this->dbID = $dbID;
    $this->detailLevel = self::TLOBJ_O_GET_DETAIL_FULL;
  }
  
  /**
   * if we fetch an object, we can set here different details levels for the objects, because we 
   * don't always need all nested data 
  
   * @param $level integer any combination of TLOBJ_O_GET_DETAIL_? constancts
   */
  public function setDetailLevel($level = self::TLOBJ_O_GET_DETAIL_FULL)
  {
    $this->detailLevel = $level;
  }
  
  /* some factory functions to be used to create tl managed objects */
  /**
   * creates any tl-managed objects
   * 
   * @param object [ref] $db the database connection
   * @param int $id the id of the object to be created (must exist in the database)
   * @param string $className the  class name of the object
   * @param int $options some additional options for creating the options (these are class specific)
   * @param int $detailLevel the detail level of the object
   * 
   * @return the newly created object on success, or null else
   */
  static public function createObjectFromDB(&$db,$id,$className,
                                            $options = self::TLOBJ_O_SEARCH_BY_ID,
                                            $detailLevel = self::TLOBJ_O_GET_DETAIL_FULL) {
    if ($id) {
      $item = new $className($id);
      $item->setDetailLevel($detailLevel);
      if ($item->readFromDB($db,$options) >= tl::OK) {
        return $item;
      } 
    }
    return null;
  }
  
  /**
   * used to create any tl-managed objects
   * 
   * @param object [ref] $db the database connection
   * @param string $query the ids of the objects to be created are obtained by this query
   * @param string $column the  name of the column which delivers the ids
   * @param string $className the  class name of the objects
   * @param boolean $returnAsMap if set to true, to objects are returned in a 
   *                map whose keys are the ids, else they are returned in a normal array.

   * @param int $detailLevel the detail level of the object
   * 
   * @return the newly created objects on success, or null else
   */
  static public function createObjectsFromDBbySQL(&$db,$query,$column,$className,$returnAsMap = false,
                                                  $detailLevel = self::TLOBJ_O_GET_DETAIL_FULL,$limit = -1)
  {
    $ids = $db->fetchColumnsIntoArray($query,$column,$limit);
    return self::createObjectsFromDB($db,$ids,$className,$returnAsMap,$detailLevel);
  }
  
  /**
   * used to create any tl-managed objects
   * 
   * @param object [ref] $db the database connection
   * @param array $ids the ids of the objects to be created
   * @param string $className the class name of the objects
   * @param boolean $returnAsMap if set to true, to objects are returned in a 
   *                map whose keys are the ids, else they are returned in a normal array.
   * @param integer $detailLevel the detail level of the object
   * 
   * @return mixed the newly created objects on success, or null else
   */
  static public function createObjectsFromDB(&$db,$ids,$className,$returnAsMap = false,
                                             $detailLevel = self::TLOBJ_O_GET_DETAIL_FULL)
  {
    $items = null;
    
    if (in_array("iDBBulkReadSerialization",class_implements($className)))
      $items = self::bulkCreateObjectsFromDB($db,$ids,$className,$returnAsMap,$detailLevel);
    else
    {
      $ids = is_null($ids) ? [] : $ids;
      for($i = 0;$i < sizeof($ids);$i++)
      {
        $id = $ids[$i];
        $item = self::createObjectFromDB($db,$id,$className,self::TLOBJ_O_SEARCH_BY_ID,$detailLevel);
        if ($item)
        {
          if ($returnAsMap)
          {
            $items[$id] = $item;
          }
          else
          {
            $items[] = $item;
          }
        }
      }
    }
    return $items;
  }
  
  /**
   * used to bulk-create tl-managed objects which support the "iDBBulkReadSerialization"-Interface
   * 
   * @param object [ref] $db the database connection
   * @param array $ids the ids of the objects to be created
   * @param string $className the class name of the objects
   * @param boolean $returnAsMap if set to true, to objects are returned in a 
   *                map whose keys are the ids, else they are returned in a normal array.
   * @param integer $detailLevel the detail level of the object
   * 
   * @return mixed the newly created objects on success, or null else
   */
  static public function bulkCreateObjectsFromDB(&$db,$ids,$className,$returnAsMap = false,
                                             $detailLevel = self::TLOBJ_O_GET_DETAIL_FULL)
  {
    $items = null;
    if (null != $ids && sizeof($ids)) { 
      $dummyItem = new $className();
      $query = $dummyItem->getReadFromDBQuery($ids,self::TLOBJ_O_SEARCH_BY_ID,$detailLevel);
      $result = $db->exec_query($query);
      if ($result) {
        while($row = $db->fetch_array($result)) {
          $item = new $className();
          $item->readFromDBRow($row);
          
          if ($returnAsMap) {
            $items[$item->dbID] = $item;
          } else {
            $items[] = $item;
          }
        }
      }
    }   
    return $items;
  }
  
  /**
   * deletes an tl-Managed object from the DB
   * 
   * @param object [rerf] $db the database connection
   * @param int $id the database-id of the object which should be deleted
   * @param string $className the class name of the object
   * 
   * @return integer result code
   */
  static public function deleteObjectFromDB(&$db,$id,$className) {
    if ($id) {
      $item = new $className($id);
      return $item->deleteFromDB($db);
    }
    return tl::ERROR;
  }
  
  /**
   * Adds the object to the cache if caching is activated
   * 
   * @return integer returns always tl::OK
   */
  protected function addToCache() {
    if ($this->activateCaching) {
      self::$objectCache[get_class($this)][$this->detailLevel][$this->dbID] = $this;
    }
    return tl::OK; 
  }
  
  /**
   * Remove the object from the cache
   * 
   * @return integer returns always tl::OK
   */
  protected function removeFromCache() {
    if ($this->activateCaching) {
      unset(self::$objectCache[get_class($this)][$this->detailLevel][$this->dbID]);
    }
    return tl::OK;
  }
  
  /**
   * Dummy implementation, each cachable object needs only to implement this function
   * The function must read the members (but not the internal ones) from object and copy it to itself
   * 
   * @param $object the object to read from
   * @return integer returns always tl::OK
   */
  protected function copyFromCache($object) {
    return tl::OK;
  }
  
  /**
   * @return integer returns tl::ERROR if caching is not activated or a cache miss happens
   *          else it returns the result of copyFromCache
   */
  public function readFromCache() {
    if (!$this->activateCaching) {
      return tl::ERROR;
    }

    if (isset(self::$objectCache[get_class($this)][$this->detailLevel][$this->dbID])) {
      $object = self::$objectCache[get_class($this)][$this->detailLevel][$this->dbID];
      return $this->copyFromCache($object);
    }
    return tl::ERROR;
  }
}
