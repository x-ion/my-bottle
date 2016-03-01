/* global fw_index */
/* global primary_pg */
/* global ip_index */

// TODO: ajax call to fetch options for select list
// TODO: eventlistener to custom option(enable input,)




///<reference path='jquery.d.ts' />


$(document).ready(function () {
    var fw_index = 1;
    var ip_index = 1;
    var primary_pg= ""
    
    // event listener for Add Rule Button
    console.log("[INFO] Initializing the tr")
    $('#fw-rules').append('<tr id="fw-' + (fw_index) + '"></tr>')
    $('#add-fw-rule').on('mousedown', function () {
        console.log('[INFO] Adding the tds')
        primary_pg = $('#source-pg').val();
        $('#fw-'+ fw_index).html(
            '<td>' + (fw_index) + '</td>' +
            '<td><input disabled value="' + primary_pg + '" type="text" class="form-control primary-pg" placeholder="Policy Group #1"></td>' +
            '<td>'+
            '<label class="radio-inline"> <input type="radio" value="inbound" name="direction-' + fw_index + '"><i class="fa fa-long-arrow-left fa-lg"></i></label>' +
            '<label class="radio-inline"> <input type="radio" value="outbound" name="direction-' + fw_index + '"><i class="fa fa-long-arrow-right fa-lg"></i></label>'+
            // '<input name="direction-' + fw_index + '" type="text" class="form-control direction" id="direction-' + fw_index + '" placeholder="Inbound/Outbound"></td>' +
            '<td><input name="secondary-pg-' + fw_index + '" type="text" class="form-control" id="secondary-pg-' + fw_index + '" placeholder="Policy Group #2"></td>'+
            '<td><input name="secondary-ip-' + fw_index + '"type="text" class="form-control ip" id="secondary-ip-' + fw_index + '" placeholder="0.0.0.0-0.0.0.10, 0.0.0.0 or 1.1.1.0/24"></td>'+
            '<td><select onchange="checkCustomService()" class="form-control service" name="service－' + fw_index + '" id="service-' + fw_index + '">'+
                    '<option value="HTTP">HTTP</option>'+
                    '<option value="HTTPS">HTTPS</option>'+
                    '<option value="SSH">SSH</option>'+
                    '<option class="custom-service" value="Custom">Custom</option>'+
                '</select></td>'+
            '<td><input name="port-protocol-' + fw_index + '"type="text" class="form-control port-protocol" id="port-protocol-' + fw_index + '" placeholder="ex. TCP/22" readonly></td>'
            );
            
        console.log("[INFO] Adding new tr")
        $('#fw-rules').append('<tr id="fw-' + (fw_index+1) + '"></tr>');

        // event listener for initializing inputmask to policy-group's firewall rules
        applyInputMask(fw_index);


        fw_index++;

        
    });

    
    $('#fw-rules').on('change', '.service', function(){ 
    	var option = $(this).find(':selected').text();
    	console.log(option);
		var index = $(this).attr('id').split('-').pop();
		
		console.log('[DEBUG] selected ID: ', index);
		if (option == 'Custom') {
			$('#port-protocol-'+index).prop("readonly", false);
		}
		else{
			$('#port-protocol-'+index).prop("readonly", true);
		};
		
    });


    
    // event listener for Delete Rule Button
    $('#delete-fw-rule').click(function () {
        console.log("[INFO] deleting tr")
        if (fw_index > 1) {
            $('#fw-'+(fw_index)).remove();
            $('#fw-'+(fw_index-1)).html('');
		    fw_index--;
            
        }
    });
    // event listener for Source PG
    $('#source-pg').change(function () {
        var value = $(this).val()
       $('.primary-pg').val(value) 
    });
    
    // event listener for adding new ips
    $('#add-ip').on("mousedown", function() {
        var $new_ip = $(
            '<div id="source-pg-ip-'+ip_index+'" class="form-group">'+
                '<div class="col-sm-1">'+
                    '<label for="ip-'+ip_index+'" class="control-label ip-label">IP</label>'+
                '</div>'+
                '<div class="col-sm-9">'+
                    '<input type="text" class="form-control ip" id="ip-'+ip_index+'" placeholder="ex. 0.0.0.0-0.0.0.10, 0.0.0.0 or 1.1.1.0/24">'+
                '</div>'+
                '<div class="col-sm-1">'+
                    '<a class="btn btn-default delete-button">Delete</a>'+
                '</div>'+
            '</div>'
            );
        // $new_ip.insertBefore($('#source-pg-ips'))
        $new_ip.appendTo($('#source-pg-ips'))

        // apply input musk for newly added ip
        applyInputMask(ip_index);

        ip_index++;

            


    });
    
    // event listener for deleting ips
    $('#source-pg-ips').on('click', '.delete-button', function(event) {
       event.preventDefault();
       console.log('[INFO] about to delete an ip', ip_index);
       $(this).parent().parent().remove();
       ip_index --;
    });

    
    
    // event listener for saving IPs
    $('#save-ip').on('click', function() {
        updateIP();
        $('.modal').modal('hide');
    });
    
});

function updateIP() {
    var ipArray = []
    $('.ip').each(function(){
        ipArray.push($(this).val())
    });
    
    console.log('[DEBUG] the result is: ', ipArray);
    
    console.log('[INFO] reset source ip');
    $('#source-ip').val(''); 
    
    $.each(ipArray,function(index, value){
        console.log('[INFO] appending: ', value);
        if($('#source-ip').val() == ''){
            $('#source-ip').val(value); 
        }
        else{
            $('#source-ip').val($('#source-ip').val() + ',\n'+ value); 
        }
        
    });
    
}

function checkCustomService(){
	
}

function applyInputMask(){
	$('.ip').each(function(){
		var tempVar = $(this).val();
    	console.log('[DEBUG] ', $(this).val())
    	$(this).inputmask({ 
        mask: '[9{1,3}.9{1,3}.9{1,3}.9{1,3}[/9{1,2}]|[-9{1,3}.9{1,3}.9{1,3}.9{1,3}]',
        keepStatic: true, 
        greedy: false  
        }).val(tempVar);
    });
}

function applyInputMask(id) {
    console.log('[INFO] input masked!')

    // apply inputmask - ip
    $('#ip-'+id).inputmask({ 
        mask: '[9{1,3}.9{1,3}.9{1,3}.9{1,3}[/9{1,2}]|[-9{1,3}.9{1,3}.9{1,3}.9{1,3}]', 
        keepStatic: true,
        greedy: false  
        });
    // apply inputmask - ip
    $('#secondary-ip-'+id).inputmask({ 
        mask: '[9{1,3}.9{1,3}.9{1,3}.9{1,3}[/9{1,2}]|[-9{1,3}.9{1,3}.9{1,3}.9{1,3}]',
        keepStatic: true,
        greedy: false  
        });
   

    // apply inputmask - protocol/port
    $('.port-protocol').inputmask({
        mask: '[AAA/9{1,5}[(,AAA/9{1,5}){*}]]',
        // placeholder: 'tcp/80',
        keepStatic: true,
        greedy: false
    });
}

