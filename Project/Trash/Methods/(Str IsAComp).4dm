//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str IsAComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str IsAComp")
If (Count parameters:C259>=1)
	$0:=(($1="@Ltd@") | ($1="@ Sons@") | ($1="@ partners@") | ($1="@ ptnrs@") | ($1="@ p/ship@") | ($1="@ group@") | ($1="@ inc") | ($1="messrs@") | ($1="@assoc@") | ($1="@Centre@") | ($1="@Center@") | ($1="@  & @") | ($1="@dept@") | ($1="@department@") | ($1="@ plc") | ($1="@Charity@"))
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Str IsAComp"; $_t_oldMethodName)