If (False:C215)
	//object Name: [DIARY]dDiary_Cal.Variable84
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Position; vCalActions)
	C_TEXT:C284($_d_Date; $_t_oldMethodName; vCalMth; vCalYr)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Cal.Variable84"; Form event code:C388)
//xAny
//I am

$_d_Date:=vCalMth+Date_Divider+vCalYr
$_d_Date:=Gen_Request("Month:"; $_d_Date)
If ((OK=1) & (Length:C16($_d_Date)>3))
	$_l_Position:=Str_PosDivide($_d_Date)
	vCalMth:=Substring:C12($_d_Date; 1; $_l_Position-1)
	vCalYr:=Substring:C12($_d_Date; $_l_Position+1; 99)
	Diary_CalPer(Date_FromStrs("1"; vCalMth; vCalYr))
	If (vCalActions>1)
		vCalActions:=2
		Diary_CalAct(1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Cal.Variable84"; $_t_oldMethodName)
