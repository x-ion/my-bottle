%rebase('base.tpl')
<div class="row">
	<h1>New Firewall Rule</h1>
	<form class="" role="form" method="post" action="/create_fw_rule">
		<div class="form-group">
			<label for="source-name" class="control-label ">Policy Group</label>
			<textarea style="width:450px" rows="5"type="text" class="form-control" name="source-name" id="source-name"></textarea>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Policy Group</th>
					<th>Direction</th>
					<th>Destination Name</th>
					<th>Destination VM and IP pair(s)</th>
					<th>Protocols and Ports</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr class="exisiting-rule">
					<td><input class="form-control" name="source-vm-ip" id="source-vm-ip"></input></td>
					<td>
						<div class="radio">
							<label><input type="radio" value="inbound" name="direction">Inbound</label>
						</div>
						<div class="radio">
							<label><input type="radio" value="outbound" name="direction">Outbound</label>
						</div>
					</td>
					<td><input type="text" class="form-control" name="destination-name" id="destination-name"></input></td>
					<td><input class="form-control" name="destination-vm-ip" id="destination-vm-ip"></input></td>
					<td><input class="form-control" name="protocols-ports" id="protocols-ports"></input></td>
					<td>
						<button type="button" class="btn btn-primary">Edit</button>
						<button type="button" class="btn btn-primary">Delete</button>
					</td>
				</tr>
				<tr class="new-rule">
					<td><input class="form-control" name="source-vm-ip" id="source-vm-ip"></input></td>
					<td>
						<div class="radio">
							<label><input type="radio" value="inbound" name="direction">Inbound</label>
						</div>
						<div class="radio">
							<label><input type="radio" value="outbound" name="direction">Outbound</label>
						</div>
					</td>
					<td><input type="text" class="form-control" name="destination-name" id="destination-name"></input></td>
					<td><input class="form-control" name="destination-vm-ip" id="destination-vm-ip"></input></td>
					<td><input class="form-control" name="protocols-ports" id="protocols-ports"></input></td>
					<td><button type="button" class="btn btn-primary">Add</button></td>
				</tr>
			</tbody>
		</table>
		
		<!-- <div class="col-xs-12" style="height:50px;"></div> -->
		
		
		<div class="col-xs-12" style="height:50px;"></div>
		
	</form>
</div>