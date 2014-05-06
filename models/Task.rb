require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/todo_list.db")

class Task
include DataMapper::Resource
property:id, Serial
property:title,Text 
property:description,Text
property:venue,Text
property:duration,Text
property:datecreated,DateTime


DataMapper.finalize.auto_upgrade! 
end