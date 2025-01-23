<!-- custom_template.tpl -->  

<input style="display:none" value="{$baseRoute}" id="baseRoute" >
<input style="display:none" value="{$apiKey}" id="apiKey" >

<div class="custom-content">  
    <h1>Sort Filtering</h1>  
			<div class="filter-container">
          <label for="order_by">Sort by:</label>
          <select name="type_filter" id="type_filter">
            <option value="priority">Priority</option>
            <option value="last_run_date">Last Run Date</option>
          </select>

          <label for="order_dir">Order:</label>
          <select name="arrangement" id="arrangement">
            <option value="ASC">Ascending</option>
            <option value="DESC">Descending</option>
          </select>

          <button type="button" id="run_filter" >Apply</button>

			</div>
</div>

<script src="./gui/javascript/tcsort/TcSort.js" type="module"></script>  
