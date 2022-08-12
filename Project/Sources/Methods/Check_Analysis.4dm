//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Analysis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_AnalysisOnly; <>PersAnOver; $_bo_Allowed; $_bo_UsePosition)
	C_LONGINT:C283($_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $5; $6)
	C_POINTER:C301($_ptr_Variable; $1; $3; $4)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Analysis")
If (Count parameters:C259>=6)
	$_l_OLeft:=$5
	$_l_OTop:=$6
	$_l_ORight:=$_l_OLeft
	$_l_OBottom:=$_l_OTop
	$_bo_UsePosition:=True:C214
	
End if 


If (<>PER_bo_AnalysisOnly)
	$1->:=<>Per_t_CurrentDefaultAnalCode
	If ($2#"")
		RELATE ONE:C42($1->)
		
		$_ptr_Variable:=Get pointer:C304("v"+$2)
		If (Type:C295($_ptr_Variable->)=Is string var:K8:2) | (Type:C295($_ptr_Variable->)=Is text:K8:3) | (Type:C295($_ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
			$_ptr_Variable->:=[ANALYSES:36]Analysis_Name:2
		End if 
	End if 
	Gen_Alert("You only have access to Analysis "+<>Per_t_CurrentDefaultAnalCode; "")
Else 
	If ($_bo_UsePosition)
		Check_MinorNC($1; $2; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis"; "-1"; True:C214; $_l_OLeft; $_l_OTop)  //10
	Else 
		Check_MinorNC($1; $2; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")  //6
	End if 
	
	If ((<>PersAnOver) & ($1->=""))
		$1->:=<>Per_t_CurrentDefaultAnalCode
		If ($2#"")
			RELATE ONE:C42($1->)
			$_ptr_Variable:=Get pointer:C304("v"+$2)
			$_ptr_Variable->:=[ANALYSES:36]Analysis_Name:2
		End if 
	End if 
End if 
If (Count parameters:C259>2)
	If ($1->#"")
		$_bo_Allowed:=Check_AnalAcc($3; $1; 2)
		If ((Count parameters:C259>3) & ($_bo_Allowed))
			$_bo_Allowed:=Check_AnalAcc($4; $1; 2)
		End if 
		If ($_bo_Allowed=False:C215)
			If ($2#"")
				RELATE ONE:C42($1->)
				$_ptr_Variable:=Get pointer:C304("v"+$2)
				$_ptr_Variable->:=[ANALYSES:36]Analysis_Name:2
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Check_Analysis"; $_t_oldMethodName)
