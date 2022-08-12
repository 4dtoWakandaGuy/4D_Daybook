//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Layouts Setting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 17:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_WidthString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layouts Setting")
//Layouts Setting
//Updates the List Layouts Settings field
$_t_WidthString:=String:C10([LIST_LAYOUTS:96]Width:5)
[LIST_LAYOUTS:96]Settings:13:=[LIST_LAYOUTS:96]Title:4+(" "*(55-Length:C16([LIST_LAYOUTS:96]Title:4)))+$_t_WidthString+(" "*(3-Length:C16($_t_WidthString)))+[LIST_LAYOUTS:96]Format:6+(" "*(15-Length:C16([LIST_LAYOUTS:96]Format:6)))+("1"*Num:C11([LIST_LAYOUTS:96]Enterable:8))+("0"*Num:C11([LIST_LAYOUTS:96]Enterable:8=False:C215))+("1"*Num:C11([LIST_LAYOUTS:96]Locked:10))+("0"*Num:C11([LIST_LAYOUTS:96]Locked:10=False:C215))+("0"*Num:C11([LIST_LAYOUTS:96]Font_Size:11=9))+("1"*Num:C11([LIST_LAYOUTS:96]Font_Size:11#9))+[LIST_LAYOUTS:96]Colour:12+(" "*(7-Length:C16([LIST_LAYOUTS:96]Colour:12)))+String:C10([LIST_LAYOUTS:96]Footer:14)
ERR_MethodTrackerReturn("Layouts Setting"; $_t_oldMethodName)