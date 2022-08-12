//%attributes = {}
If (False:C215)
	//Project Method Name:      AddTypes_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_addressFormatNotation; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AddTypes_InLPB")
If ((vAdd=1) & ([ADDRESS_FORMATS:74]Format_Code:1=""))
	[ADDRESS_FORMATS:74]Address_1_Name:3:=<>DB_t_Address1Label
	[ADDRESS_FORMATS:74]Address_2_Name:4:=<>DB_t_Address2Label
	[ADDRESS_FORMATS:74]Town_Name:5:=<>DB_t_TownLabel
	[ADDRESS_FORMATS:74]County_Name:6:=<>DB_t_CountyLabel
	[ADDRESS_FORMATS:74]Postcode_Name:7:=<>DB_t_PostcodeLabel
	[ADDRESS_FORMATS:74]Country_Name:8:=<>DB_t_CountryLabel
	[ADDRESS_FORMATS:74]Address_Text:9:=<>DB_t_addressFormatNotation
End if 
Macro_AccType("Load "+String:C10(Table:C252(->[ADDRESS_FORMATS:74])))
ERR_MethodTrackerReturn("AddTypes_InLPB"; $_t_oldMethodName)
