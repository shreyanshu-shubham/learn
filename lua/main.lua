-- coments start with double dash
--[[
    this is a milti line comment
    wrapped in double square brackets
    leading with double dash
    NOTE: no space between  dash and bracket
]]
print("hello world" .. "there") -- .. used to concatenate
--[[
    types
    > nil
    > numbers
    > string
    > bool
    > table
]]

local var 
print(var) -- nil
local name = "shreyanshu" -- string can be within double or single quotes
print("hello " .. name) -- hello shreyanshu
name = [[this
is 
    multi-line
string
]]
print(name)
print(type(name))

--[[
only nil and false are false in lua 
0 is also true 
]]

-- define any var without local will set it at global
-- so to define global var
var_global = "new"
_G.var = "new"

print(type(name))
print(tonumber("22")) --> 22
print(tonumber("22a")) --> nil


-- there is a math library 
print(math.pi) --> 3.14...

print(math.random()) --> gives random number between 0 and 1
-- this i not very random so we do
math.randomseed(os.time())
print(math.random()) --> gives random number between 0 and 1
print(math.random(10)) --> gives random number between 1 and 10 both included
print(math.random(10,50)) --> gives random number between 10 and 50 both included

print(math.min(2,5,4,1,7)) --> 1
-- there are more function like floor, ceil, cos, tan

print(string.len("string"))
print(#"string") -- also gives length of the string
print(string.lower("string"))
print(string.upper("string"))
print(string.sub("string",1,3)) -- to get the substring

print(string.char(65)) --> A
print(string.byte("A")) --> 65
print(string.rep("A",3)) --> AAA
print(string.rep("A",3,",")) --> A,A,A

print(string.format("hello %s my age is %i and bank balance is %.2f","tron",34,124.3456)) --> hello tron my age is 34 and bank balance is 124.35
print(string.find("shreyanshu shubham","shu")) --> 8    10 [that means that it starts at 8 and ends at 10]
local begin, ending = string.find("shreyanshu shubham","shu") --> 8    10 [that means that it starts at 8 and ends at 10]
print(string.find("shreyanshu shubham","ohm")) --> nil
-- to replace character(s) use string.gsub

-- in conditional statement not equals is written as ~=
local age=18
if age>=18 and age<=25 then
    print("18-25")
elseif not (age~=26) then
    print("26")
else
    print("else")
end

-- loops
-- for i = start,end,increment/decreament do
-- increment is optional and default to 1
for i = 1,10,1 do
    print(i)
end

local arr = {1,2,3,4,5}
for i = 1,#arr do
    print(arr[i])
end

while true do
    print("something")
end

-- do loop is written as following
repeat
    print("something")
until true

io.write("enter name: ") -- print to screen without new line
local name = io.read() -- it reads everythig as strings


