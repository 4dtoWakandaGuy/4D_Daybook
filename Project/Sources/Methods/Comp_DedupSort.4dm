//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_DedupSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1; ch2; ch3; ch4; ch5)
	C_TEXT:C284($_t_oldMethodName; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_DedupSort")
$_t_Text:=""
If (ch1=1)
	$_t_Text:="Company Name, "
End if 
If (ch3=1)
	$_t_Text:=$_t_Text+"Town or City, "
End if 
If (ch4=1)
	$_t_Text:=$_t_Text+"Postal Code, "
End if 
If (ch5=1)
	$_t_Text:=$_t_Text+"Telephone, "
End if 
If (ch2=1)
	$_t_Text:=$_t_Text+"Address 1, "
End if 
$_t_Text:=Substring:C12($_t_Text; 1; Length:C16($_t_Text)-2)
Gen_Alert("Please sort the list. Suggested order:"+Char:C90(13)+$_t_Text; "")
ORDER BY:C49([COMPANIES:2])
ERR_MethodTrackerReturn("Comp_DedupSort"; $_t_oldMethodName)