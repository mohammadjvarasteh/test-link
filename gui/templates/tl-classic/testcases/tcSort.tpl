<!-- custom_template.tpl -->  
<div class="custom-content">  
    <h1>Sort Filtering</h1>  
			<div class="filter-container">
			  <form id="filterForm" method="get" action="">
				<label for="order_by">Sort by:</label>
				<select name="order_by" id="order_by">
				  <option value="importance">Priority</option>
				  <option value="last_run_date">Last Run Date</option>
				</select>

				<label for="order_dir">Order:</label>
				<select name="order_dir" id="order_dir">
				  <option value="ASC">Ascending</option>
				  <option value="DESC">Descending</option>
				</select>

				<button type="submit">Apply</button>
			  </form>
			</div>
</div>

<script src="./gui/javascript/tc-sort.js" type="text/javascript"></script>  
