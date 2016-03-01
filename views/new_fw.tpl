%rebase('base.tpl')
<div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>New Firewall Rule</h1>
                    <br>
                    <br>

                    <form class="form-horizontal" role="form" method="post" action="/create_fw_rule">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label for="inputEmail3" class="control-label">Policy Group</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="source-pg" name="source-pg" placeholder="Policy Group Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label for="inputPassword3" class="control-label">IP Addresses</label>
                            </div>
                            <div class="col-sm-6">
                                <textarea class="form-control" id="source-ip" name="source-ip" placeholder="0.0.0.0" rows="5" type="text" readonly></textarea>
                            </div>
                            <div class="col-sm-1">
                                <a class="btn btn-default" data-toggle="modal" data-target="#EditIPModal"><i class="fa fa-pencil-square-o"></i></a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label>Firewall Rules: </label>
                            </div>
                            <div class="col-sm-2">
                                <a id="add-fw-rule" class="btn btn-default">Add a New Rule</a>
                            </div>
                            <div class="col-sm-2">
                                <a id="delete-fw-rule" class="btn btn-default">Delete a Rule</a>
                            </div>
                        </div>
                        <br/>
                        <table class="table table-bordered table-condensed table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Primary Group</th>
                                    <th>Direction</th>
                                    <th>Secondary Group</th>
                                    <th>IP Addresses</th>
                                    <th>Service</th>
                                    <th>Custom Protocol/Port</th>
                                </tr>
                            </thead>
                            <tbody id="fw-rules">
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-offset-5 col-md-2">
                                <input type="submit" value="Submit Rules" id="submit-fw-rule" class="btn btn-default"/>
                                <!-- <input name="submit" type="submit" value="Add" class="btn btn-primary" /> -->
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <div class="modal fade" id="EditIPModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <div class="modal-title">
                        <h4>Edit IP Addresses &nbsp;&nbsp; <a id="add-ip" class="btn btn-default">Add</a></h4>
                    </div>
                    
                    <!--<div class="form-group">
                        <div class="col-sm-offset-1 col-sm-11">
                            <a id="add-ip" class="btn btn-default">Add</a>
                        </div>
                    </div>-->
                </div>
                <div class="modal-body">
                    <div id="source-pg-ips" class="form-horizontal" role="form">

                        
                    </div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-default" data-dismiss="modal">Close</a>
                    <a class="btn btn-primary" id="save-ip">Save changes</a>
                </div>
            </div>
        </div>
    </div>
