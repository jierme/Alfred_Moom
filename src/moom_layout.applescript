on run argv
	set workflowFolder to do shell script "pwd"
	set wlib to load script POSIX file (workflowFolder & "/lib/lib.scpt")
	set wf to wlib's workflow()
	set theAction to item 1 of argv as text
	set listId to (system attribute "list")
	
	if theAction is "showLayouts" then
		showLayouts(wf)
	end if
	
end run

on showLayouts(wf)
	tell application "Moom"
		repeat with n from 1 to count of (list of snapshots)
			set listName to item n of (list of snapshots)
			set listId to id of item n of (list of snapshots)
			
			if n < 9 and n ¡Ù 6 then
				add_item of wf with valid given title:listName, subtitle:"", arg: listName
			end if
		end repeat
	end tell
	return wf's to_json()
end showLayouts
