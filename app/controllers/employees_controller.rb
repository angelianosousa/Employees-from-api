class EmployeesController < ApplicationController
  require 'rest-client'

  def index
    resp = RestClient.get("https://randomuser.me/api?format=json&results=30&inc=gender,name,email,picture&nat=br&seed=giga")
    @employees = JSON.parse(resp.body)["results"]
  end
end
