import os
import json
from bottle import route, run, template, static_file, get, post, request


@route('/')
def index():
    return template('index')
@route('/name/<name>')
def name(name):
    return template('index.tpl')




@route('/fw_rules')
def list_fw_rules():
	pass

@route('/check_fw')
def check_fw():
	return template('index.tpl')

@route('/create_fw_rule', method='GET')
def new_fw_rule():
	return template('new_fw.tpl')

@route('/create_fw_rule', method='POST')
def create_fw_rule():
	
	source_pg = [] #request.forms.get('source-name')
	source_ip = []#request.forms.get('source-vm-ip')
	secondary_pg = []#request.forms.get('destination-name')
	secondary_ip = [] #request.forms.get('destination-vm-ip')
	services = []
	protocols_ports = []#request.forms.get('protocols-ports')

	# print source_vm_ip
	# print destination_vm_ip
	# print protocols_ports
	for item in request.forms:
		print "key- %s: value- %s" %(item, request.forms.get(item))

	

	# if generate_table(source_name = source_name, source_ips = source_vm_ip, destination_name = destination_name, destination_ips = destination_vm_ip, protocols_ports = protocols_ports):
	# 	print 'Successed!'
	# 	return template('index.tpl')
	# else:
	# 	print 'Failed'
	return template('index.tpl')


def generate_table(source_ips, source_name, destination_ips, destination_name, protocols_ports):

	source_ip_list = source_ips.split(',')
	destination_ip_list = destination_ips.split(',')
	protocol_port_list = protocols_ports.split(',')

	ipset_record_json = {"source_name":source_name,"source_ip_list":source_ip_list,"destination_name":destination_name,"destination_ip_list":destination_ip_list, "protocols_ports":protocols_ports}
	security_group_record_json = {""}
	print json.dumps(ipset_record_json)
	return True



@route('/static/:filepath')
def server_static(filepath):
    return static_file(filepath, root='./static')

@route('/fonts/:filepath')
def server_static(filepath):
    return static_file(filepath, root='./static/fonts')

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='0.0.0.0', port=port, debug=True, reloader=True)
