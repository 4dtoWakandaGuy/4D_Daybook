//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Error_EventTranslate
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
//$_t_oldMethodName:=ERR_MethodTracker ("Error_EventTranslate")


//Error_EventTranslate -added 11/12/08 v631b120l / v631b120h_3 -kmw


C_LONGINT:C283($1; $EventNumber)
C_TEXT:C284($0; $EventText)
//
$EventText:=""

If (Count parameters:C259>0)
	$EventNumber:=$1
	
	C_BOOLEAN:C305(DB_bo_NoLoad)
	Case of 
		: ($EventNumber=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
			$EventText:="On Load"
		: ($EventNumber=On Unload:K2:2)
			$EventText:="On Unload"
		: ($EventNumber=On Validate:K2:3)
			$EventText:="On Validate"
		: ($EventNumber=On Clicked:K2:4)
			$EventText:="On Clicked"
		: ($EventNumber=On Double Clicked:K2:5)
			$EventText:="On Double Clicked"
		: ($EventNumber=On Before Keystroke:K2:6)
			$EventText:="On Before Keystroke"
		: ($EventNumber=On After Keystroke:K2:26)
			$EventText:="On After Keystroke"
		: ($EventNumber=On After Edit:K2:43)
			$EventText:="On After Edit"
		: ($EventNumber=On Getting Focus:K2:7)
			$EventText:="On Getting Focus"
		: ($EventNumber=On Losing Focus:K2:8)
			$EventText:="On Losing Focus"
		: ($EventNumber=On Activate:K2:9)
			$EventText:="On Activate"
		: ($EventNumber=On Deactivate:K2:10)
			$EventText:="On Deactivate"
		: ($EventNumber=On Outside Call:K2:11)
			$EventText:="On Outside Call"
		: ($EventNumber=On Drop:K2:12)
			$EventText:="On Drop"
		: ($EventNumber=On Drag Over:K2:13)
			$EventText:="On Drag Over"
		: ($EventNumber=On Mouse Enter:K2:33)
			$EventText:="On Mouse Enter"
		: ($EventNumber=On Mouse Move:K2:35)
			$EventText:="On Mouse Move"
		: ($EventNumber=On Mouse Leave:K2:34)
			$EventText:="On Mouse Leave"
		: ($EventNumber=On Menu Selected:K2:14)
			$EventText:="On Menu Selected"
		: ($EventNumber=On Data Change:K2:15)
			$EventText:="On Data Change"
		: ($EventNumber=On Plug in Area:K2:16)
			$EventText:="On Plug in Area"
		: ($EventNumber=On Header:K2:17)
			$EventText:="On Header"
		: ($EventNumber=On Printing Detail:K2:18)
			$EventText:="On Printing Detail"
		: ($EventNumber=On Printing Break:K2:19)
			$EventText:="On Printing Break"
		: ($EventNumber=On Printing Footer:K2:20)
			$EventText:="On Printing Footer"
		: ($EventNumber=On Close Box:K2:21)
			$EventText:="On Close Box"
		: ($EventNumber=On Display Detail:K2:22)
			$EventText:="On Display Detail"
		: ($EventNumber=On Open Detail:K2:23)
			$EventText:="On Open Detail"
		: ($EventNumber=On Close Detail:K2:24)
			$EventText:="On Close Detail"
		: ($EventNumber=On Resize:K2:27)
			$EventText:="On Resize"
		: ($EventNumber=On Selection Change:K2:29)
			$EventText:="On Selection Change"
		: ($EventNumber=On Load Record:K2:38)
			$EventText:="On Load Record"
		: ($EventNumber=On Timer:K2:25)
			$EventText:="On Timer"
		: ($EventNumber=On Before Data Entry:K2:39)
			$EventText:="On Before Data Entry"
		: ($EventNumber=On Column Moved:K2:30)
			$EventText:="On Column Moved"
		: ($EventNumber=On Row Moved:K2:32)
			$EventText:="On Row Moved"
		: ($EventNumber=On Column Resize:K2:31)
			$EventText:="On Column Resize"
		: ($EventNumber=On Header Click:K2:40)
			$EventText:="On Header Click"
		: ($EventNumber=On After Sort:K2:28)
			$EventText:="On After Sort"
		: ($EventNumber=On Long Click:K2:37)
			$EventText:="On Long Click"
		: ($EventNumber=On Alternative Click:K2:36)
			$EventText:="On Arrow Click"
		: ($EventNumber=On Expand:K2:41)
			$EventText:="On Expand"
		: ($EventNumber=On Collapse:K2:42)
			$EventText:="On Collapse"
			
		Else 
			$EventText:="Unknown Event No. "+String:C10($EventNumber)
	End case 
	
Else 
	$EventText:=""
End if 


$0:=$EventText


//ERR_MethodTrackerReturn ("Error_EventTranslate";$_t_oldMethodName)