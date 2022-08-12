//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_CCNo2
	//------------------ Method Notes ------------------
	//Check_CCNo - using the LUHN Check
	//multiple each digit by 1 or 2 alternately, the last always being 1
	//add the component parts of the products
	//the result must be a multiple of 10
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Combined; $_l_OffsetIndex; $_l_StringIndex; $_l_StringLength)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_NewString; $_t_NumberSTR; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CCNo2")
$1->:=Str_NumSpOnly($1->)
$_t_NumberSTR:=Str_NumOnly($1->)
$_l_StringLength:=Length:C16($_t_NumberSTR)
$_t_NewString:=""
$_l_OffsetIndex:=1
For ($_l_StringIndex; $_l_StringLength; 1; -1)  //work backwards alternately multiplying by 1 then 2
	$_t_NewString:=$_t_NewString+String:C10(Int:C8(Num:C11(Substring:C12($_t_NumberSTR; $_l_StringIndex; 1))*$_l_OffsetIndex))
	$_l_OffsetIndex:=1+(Num:C11($_l_OffsetIndex=1))
End for 
$_l_StringLength:=Length:C16($_t_NewString)
$_l_Combined:=0
For ($_l_StringIndex; 1; $_l_StringLength)  //add together all the raw component numbers
	$_l_Combined:=$_l_Combined+Num:C11(Substring:C12($_t_NewString; $_l_StringIndex; 1))
End for 
If (($_l_Combined/10)=(Int:C8($_l_Combined/10)))  //if is a multiple of 10
	$0:=True:C214
	OK:=1
Else 
	$0:=False:C215
	OK:=0
End if 
ERR_MethodTrackerReturn("Check_CCNo2"; $_t_oldMethodName)