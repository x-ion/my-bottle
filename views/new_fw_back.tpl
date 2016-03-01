%rebase('base.tpl')
<div class="row">
	<h1>New Firewall Rule</h1>
	<form class="" role="form" method="post" action="/create_fw_rule">
		<div class="form-group">
			<label for="source-name" class="control-label ">Policy Group</label>
			<textarea style="width:450px" rows="5"type="text" class="form-control" name="source-name" id="source-name"></textarea>
		</div>
		<div class="form-group">
			<label for="source-vm-ip" class="control-label col-sm-1">Source VM and IP pair(s): </label>
			<div class="col-sm-2">
				<input class="form-control" name="source-vm-ip" id="source-vm-ip"></textarea>
			</div>
		</div>
		<!-- <div class="col-xs-12" style="height:50px;"></div> -->
		<div class="form-group">
			<label for="destination-name" class="control-label col-sm-1">Destination Name: </label>
			<div class="col-sm-2">
				<input type="text" class="form-control" name="destination-name" id="destination-name"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="destination-vm-ip" class="control-label col-sm-1">Destination VM and IP pair(s): </label>
			<div class="col-sm-2">
				<input class="form-control" name="destination-vm-ip" id="destination-vm-ip"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="protocols-ports" class="control-label col-sm-1">Protocols and Ports: </label>
			<div class="col-sm-2">
				<input class="form-control" name="protocols-ports" id="protocols-ports"></textarea>
			</div>
		</div>
		<div class="col-xs-12" style="height:50px;"></div>
		<div class="col-sm-2">
			<input name="submit" type="submit" value="Add" class="btn btn-primary" />
		</div>
	</form>
	
</div>