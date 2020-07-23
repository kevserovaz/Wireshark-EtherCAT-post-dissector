-- Append "<dst> -> <src>" to the Info column with a post-dissector.
-- (Taps are not guaranteed to be run at a point when they can set the
-- column text, so they can't be used for this.)
--local function getstring(finfo) 
--local ok, val = pcall(tostring, finfo) 
--if not ok then val = "(unknown)" end 
--return val 
--end 
--if ecat.cmd==tostring(00)

--wiresharktaki sutunlar : time(relative),source mac, dest mac, padbyte(protocol sutunnuna yazdim), length, ve info olmali!!!
ecatpadbytes=Field.new("ecat.subframe.pad_bytes")	
ecatcmd1= Field.new("ecat.sub1.cmd")
ecatdt1 = Field.new("ecat.sub1.data")
ecatado1= Field.new("ecat.sub1.ado")


ecatcmd2= Field.new("ecat.sub2.cmd")
ecatado2=  Field.new("ecat.sub2.ado")
ecatdt2 = Field.new("ecat.sub2.data")


ecatcmd3= Field.new("ecat.sub3.cmd")
ecatdt3=  Field.new("ecat.sub3.data")
ecatado3= Field.new("ecat.sub3.ado")


ecatcmd4= Field.new("ecat.sub4.cmd")
ecatdt4=  Field.new("ecat.sub4.data")
ecatado4= Field.new("ecat.sub4.ado")

ecatcmd5= Field.new("ecat.sub5.cmd")
ecatdt5=  Field.new("ecat.sub5.data")
ecatado5= Field.new("ecat.sub5.ado")

ecatcmd6= Field.new("ecat.sub6.cmd")
ecatdt6=  Field.new("ecat.sub6.data")
ecatado6= Field.new("ecat.sub6.ado")


ecatcmd7= Field.new("ecat.sub7.cmd")
ecatdt7=  Field.new("ecat.sub7.data")
ecatado7= Field.new("ecat.sub7.ado")

--ecatpad= Field.new("ecat.subframe.pad_bytes")

-- create a new protocol so we can register a post-dissector
local myproto = Proto("swapper","Dummy proto to edit info column")

-- the dissector function callback
function myproto.dissector(tvb,pinfo,tree)
	--heur_dissector.add("ecat.data")
local fields = { all_field_infos() } 
--local tcp_port_table=DissectorTable.get("ecatf.data") 
--for ix, finfo in ipairs(fields) do 
local ecmd1
local edt1
local eado1
if (ecatcmd1() == nil) then
	ecmd1=99
	edt1=''
	eado1=0
else
	 ecmd1=tonumber(tostring(ecatcmd1()))
	 edt1=ecatdt1()
	 eado1=ecatado1()
end

local ecmd2
local edt2
local eado2
if (ecatcmd2() == nil) then
	ecmd2=99
	edt2=''
	eado2=0
else
	 ecmd2=tonumber(tostring(ecatcmd2()))
	 edt2=ecatdt2()
	 eado2=ecatado2()
end

local ecmd3
local edt3
local eado3
if (ecatcmd3() == nil) then
ecmd3=99
edt3=''
eado3=0
else
 ecmd3=tonumber(tostring(ecatcmd3()))
 edt3=ecatdt3()
 eado3=ecatado3()
end

local ecmd4
local edt4
local eado4
if (ecatcmd4() == nil) then
ecmd4=99
edt4=''
eado4=0
else
 ecmd4=tonumber(tostring(ecatcmd4()))
 edt4=ecatdt4()
 eado4=ecatado4()
end

local ecmd5
local edt5
local eado5
if (ecatcmd5() == nil) then
ecmd5=99
edt5=''
eado5=0
else
 ecmd5=tonumber(tostring(ecatcmd5()))
 edt5=ecatdt5()
 eado5=ecatado5()
end

local ecmd6
local edt6
local eado6
if (ecatcmd6() == nil) then
ecmd6=99
edt6=''
eado6=0
else
 ecmd6=tonumber(tostring(ecatcmd6()))
 edt6=ecatdt6()
 eado6=ecatado6()
end

local ecmd7
local edt7
local eado7
if (ecatcmd7() == nil) then
ecmd7=99
edt7=''
eado7=0
else
 ecmd7=tonumber(tostring(ecatcmd7()))
 edt7=ecatdt7()
 eado7=ecatado7()
end

local epad=ecatpadbytes()
--local edt3=ecatdt3()
--local edt3=ecatpad()
--pinfo.cols.info:set(" " ..tostring(edt1).."!"..tostring(edt2).."!"..tostring(edt3))
--local stree=tree:add(myproto,'DENEME')
--stree:add(edt3)
--pinfo.cols.DENEME:set(" " ..tostring(edt3))

--if (tostring(edt1) ~= nil or tostring(edt1) ~= '') then
pinfo.cols.protocol:set(" "..((string.len(tostring(epad)))+1)/3)
if (ecmd1~= 99) then
	if (ecmd1==12) then
		pinfo.cols.info:append(";"..tostring(edt1)";")
	end
	if (ecmd1~=1 and ecmd1~=2 and ecmd1~=4 and ecmd1~=5 and ecmd1~=7 and ecmd1~=8 and ecmd1~=13) then
		edt1=(string.len(tostring(edt1))+1)/3
		pinfo.cols.info:set(" "..ecmd1.."+"..tostring(edt1))
	else
		pinfo.cols.info:set(" "..ecmd1.."+"..tonumber(tostring(eado1)))
	end

end

--if (tostring(edt2) ~= nil or tostring(edt2) ~= '') then
if (ecmd2~= 99) then
	if (ecmd2== 12) then
		pinfo.cols.info:append(";"..tostring(edt2)";")
	end

	if (ecmd2~=1 and ecmd2~=2 and ecmd2~=4 and ecmd2~=5 and ecmd2~=7 and ecmd2~=8 and ecmd2~=13) then
		edt2=(string.len(tostring(edt2))+1)/3
		pinfo.cols.info:append(";"..ecmd2.."+"..tostring(edt2))
	else
		pinfo.cols.info:append(";"..ecmd2.."+"..tonumber(tostring(eado2)))
	end

end

--if (tostring(edt3) ~= nil or tostring(edt3) ~= '') then
if (ecmd3~= 99) then
	if (ecmd3== 12) then
		pinfo.cols.info:append(";"..tostring(edt3)";")
	end

	if (ecmd3~=1 and ecmd3~=2 and ecmd3~=4 and ecmd3~=5 and ecmd3~=7 and ecmd3~=8 and ecmd3~=13) then
		edt3=(string.len(tostring(edt3))+1)/3
		pinfo.cols.info:append(";"..ecmd3.."+"..tostring(edt3))
	else
		pinfo.cols.info:append(";"..ecmd3.."+"..tonumber(tostring(eado3)))
	end
end

--if (tostring(edt4) ~= nil or tostring(edt4) ~= '') then
if (ecmd4~= 99) then
	if (ecmd4== 12) then
		pinfo.cols.info:append(";"..tostring(edt4)";")
	end

	if (ecmd4~=1 and ecmd4~=2 and ecmd4~=4 and ecmd4~=5 and ecmd4~=7 and ecmd4~=8 and ecmd4~=13) then
		edt4=(string.len(tostring(edt4))+1)/3
		pinfo.cols.info:append(";"..ecmd4.."+"..tostring(edt4))
	else
		pinfo.cols.info:append(";"..ecmd4.."+"..tonumber(tostring(eado4)))
	end
end

--if (tostring(edt5) ~= nil or tostring(edt5) ~= '') then
if (ecmd5~= 99) then
	if (ecmd5== 12) then
		pinfo.cols.info:append(";"..tostring(edt5)";")
	end

	if (ecmd5~=1 and ecmd5~=2 and ecmd5~=4 and ecmd5~=5 and ecmd5~=7 and ecmd5~=8 and ecmd5~=13) then
		edt5=(string.len(tostring(edt5))+1)/3
		pinfo.cols.info:append(";"..ecmd5.."+"..tostring(edt5))
	else
		pinfo.cols.info:append(";"..ecmd5.."+"..tonumber(tostring(eado5)))
	end
end

--if (tostring(edt6) ~= nil or tostring(edt6) ~= '') then
if (ecmd6~= 99) then
	if (ecmd6== 12) then
		pinfo.cols.info:append(";"..edt6..";")
	end

	if (ecmd6~=1 and ecmd6~=2 and ecmd6~=4 and ecmd6~=5 and ecmd6~=7 and ecmd6~=8 and ecmd6~=13) then
		edt6=(string.len(tostring(edt6))+1)/3
		pinfo.cols.info:append(";"..ecmd6.."+"..tostring(edt6))
	else
		pinfo.cols.info:append(";"..ecmd6.."+"..tonumber(tostring(eado6)))
	end
end

--if (tostring(edt7) ~= nil or tostring(edt7) ~= '') then
if (ecmd7~= 99) then
	if (ecmd7== 12) then
		pinfo.cols.info:append(";"..tostring(edt7)";")
	end
	if (ecmd7~=1 and ecmd7~=2 and ecmd7~=4 and ecmd7~=5 and ecmd7~=7 and ecmd7~=8 and ecmd7~=13) then
		edt7=(string.len(tostring(edt7))+1)/3
		pinfo.cols.info:append(";"..ecmd7.."+"..tostring(edt7))
	else
		pinfo.cols.info:append(";"..ecmd7.."+"..tonumber(tostring(eado7)))
	end
end
end




--";"..tonumber(tostring(ecmd3)).."+"..((string.len(tostring(edt3))+1)/3)..
--";"..tonumber(tostring(ecmd4)).."+"..((string.len(tostring(edt4))+1)/3)..
--";"..tonumber(tostring(ecmd5)).."+"..((string.len(tostring(edt5))+1)/3)..
--";"..tonumber(tostring(ecmd6)).."+"..((string.len(tostring(edt6))+1)/3)..
--";"..tonumber(tostring(ecmd7)).."+"..((string.len(tostring(edt7))+1)/3))

--else
--pinfo.cols.info:set(" "..tonumber(tostring(ecmd1)).."+"..tostring(edt1))
--end
--pinfo.cols.info:set(" "..tonumber(tostring(ecmd1)).."+"..tonumber(tostring(edt1)).. 
--";"..tonumber(tostring(ecmd2)).."+"..tonumber(tostring(edt2))..
--";"..tonumber(tostring(ecmd3)).."+"..tonumber(tostring(edt3))..
--";"..tonumber(tostring(ecmd4)).."+"..tonumber(tostring(edt4))..
--";"..tonumber(tostring(ecmd5)).."+"..tonumber(tostring(edt5))..
--";"..tonumber(tostring(ecmd6)).."+"..tonumber(tostring(edt6)))
--end

-- register our new dummy protocol for post-dissection
register_postdissector(myproto)
local function dialog_menu()

end
register_menu("Lua/ECATPostDissector", dialog_menu, MENU_TOOLS_UNSORTED)


