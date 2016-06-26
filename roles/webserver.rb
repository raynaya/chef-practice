#webserver.rb

name "webserver"
description "webservers"
run_list "recipe[my-company]","recipe[apache]"
default_attributes({
	"company" => "Coviam Inc"
	})
