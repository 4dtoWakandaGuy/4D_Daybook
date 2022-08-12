//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QA_Lookup2
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
	C_LONGINT:C283($_l_QAReturn; $_l_SearchVal2; $1; QA_l_Return; QA_l_SearchVAL; QA_l_SearchVAL2)
	C_TEXT:C284($_t_oldMethodName; $sg; MOD_FieldValue; vCounty; vPostCode; vSubGroup1; vSubGroup2; vTown)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QA_Lookup2")

vSubGroup1:=""
$_l_SearchVal2:=79
QA_l_Return:=0
QA_l_SearchVAL:=5
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vSubGroup1; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)

$_l_QAReturn:=QA_l_Return
MOD_FieldValue:=""
RemoveLeadTr(vSubGroup1; ->MOD_FieldValue)
$sg:=MOD_FieldValue
QA_l_Return:=0
QA_l_SearchVAL:=6
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vSubGroup1; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)

$_l_QAReturn:=QA_l_Return
RemoveLeadTr(vSubGroup1; ->vSubGroup1)
If (($sg#"") & (vSubGroup1#""))
	vSubGroup1:=$sg+", "+vSubGroup1
Else 
	If (vSubGroup1="")
		vSubGroup1:=$sg
	End if 
End if 
vSubGroup2:=""
QA_l_Return:=0
QA_l_SearchVAL:=7
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vSubGroup2; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)

$_l_QAReturn:=QA_l_Return
MOD_FieldValue:=""
RemoveLeadTr(vSubGroup2; ->MOD_FieldValue)
QA_l_Return:=0
QA_l_SearchVAL:=8
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vSubGroup2; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)


$_l_QAReturn:=QA_l_Return
RemoveLeadTr(vSubGroup2; ->vSubGroup2)
If (($sg#"") & (vSubGroup2#""))
	vSubGroup2:=$sg+", "+vSubGroup2
Else 
	If (vSubGroup2="")
		vSubGroup2:=$sg
	End if 
End if 
If (vSubGroup2=vSubGroup1)
	vSubGroup2:=""
End if 
QA_l_Return:=0
QA_l_SearchVAL:=9
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vTown; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)


$_l_QAReturn:=QA_l_Return

RemoveLeadTr(vTown; ->vTown)
QA_l_Return:=0
QA_l_SearchVAL:=9
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vCounty; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)


$_l_QAReturn:=QA_l_Return

RemoveLeadTr(vCounty; ->vCounty)
QA_l_Return:=0
QA_l_SearchVAL:=9
QA_l_SearchVAL2:=$_l_SearchVal2
PLUGCALL_QuickAddress("RapidAddrLine"; $1; ->QA_l_Return; ->vPostCode; ->QA_l_SearchVAL; ->QA_l_SearchVAL2)

$_l_QAReturn:=QA_l_Return
RemoveLeadTr(vPostCode; ->vPostCode)
ERR_MethodTrackerReturn("QA_Lookup2"; $_t_oldMethodName)
