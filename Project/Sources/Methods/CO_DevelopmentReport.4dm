//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_DevelopmentReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   15/05/2010 10:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACT_al_Selected;0)
	ARRAY TEXT:C222($_at_SelectedActionCodes; 0)
	//ARRAY TEXT(ACT_at_ActionCodes;0)
	//ARRAY TEXT(ACT_at_ActionNames;0)
	C_DATE:C307(vDnDateF)
	C_LONGINT:C283($_l_Index; vAct1; vAct2; vAct3; vAct4; vNo; vNo1; vNo2; vNo3; vNo4)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_DevelopmentReport")
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage

If (Not:C34(SR_ReportOK("CompDevel")))
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; ACT_at_ActionCodes; [ACTIONS:13]Action_Name:2; ACT_at_ActionNames)
	SORT ARRAY:C229(ACT_at_ActionNames; ACT_at_ActionCodes)
	ARRAY LONGINT:C221(ACT_al_Selected; 0)
	ARRAY LONGINT:C221(ACT_al_Selected; Size of array:C274(ACT_at_ActionCodes))
	GEN_AskSelection(260; 180; "Please Select up to 4 Actions to report on"; "Actions.."; ->ACT_al_Selected; "ACT_at_ActionCodes"; "Action Code"; "180"; "False"; "ACT_at_ActionNames"; "Name"; "250"; "False")
	ARRAY TEXT:C222($_at_SelectedActionCodes; 0)
	For ($_l_Index; 1; Size of array:C274(ACT_al_Selected))
		If (ACT_al_Selected{$_l_Index}>0)
			APPEND TO ARRAY:C911($_at_SelectedActionCodes; ACT_at_ActionCodes{ACT_al_Selected{$_l_Index}})
		End if 
	End for 
	
	For ($_l_Index; 1; 4)  // we only do the first 4
		If ($_l_Index<=Size of array:C274($_at_SelectedActionCodes))
			$_ptr_Variable:=Get pointer:C304("vTitle"+String:C10($_l_Index))
			$_ptr_Variable->:=$_at_SelectedActionCodes{$_l_Index}
		Else 
			$_ptr_Variable:=Get pointer:C304("vTitle"+String:C10($_l_Index))
			$_ptr_Variable->:=""
		End if 
	End for 
	//i:=i+1
	//End while
	vDnDateF:=Gen_RequestDate("Start from Date:"; Is date:K8:7)
	
	If (OK=1)
		vAct1:=0
		vAct2:=0
		vAct3:=0
		vAct4:=0
		vNo1:=0
		vNo2:=0
		vNo3:=0
		vNo4:=0
		
		vNo:=Records in selection:C76([COMPANIES:2])
		ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Code:1; >)
		BREAK LEVEL:C302(1)
		ACCUMULATE:C303(Vact1; vAct2; vAct3; vAct4)
		FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Devlt")
		PRINT SELECTION:C60([COMPANIES:2])
		
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("CO_DevelopmentReport"; $_t_oldMethodName)