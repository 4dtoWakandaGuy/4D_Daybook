If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oExtraDatesVolume
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_aB_IssueInsert;0)
	//ARRAY BOOLEAN(PRD_abo_IssueInsert;0)
	C_DATE:C307($_d_FirstDate; $_d_LastDate; PRD_d_FIrstDate; PRD_d_LastDate)
	C_LONGINT:C283($_l_Count; $_l_IssuesIndex; PRD_l_ExtraDates)
	C_REAL:C285(PRD_R_Quantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oExtraDatesVolume"; Form event code:C388)
$_l_Count:=0
$_d_FirstDate:=!00-00-00!
$_d_LastDate:=!00-00-00!
For ($_l_IssuesIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
	If (PRD_abo_IssueInsert{$_l_IssuesIndex})
		$_l_Count:=$_l_Count+1
	End if 
End for 
PRD_R_Quantity:=$_l_Count+PRD_l_ExtraDates
PRD_d_FIrstDate:=$_d_FirstDate
PRD_d_LastDate:=$_d_LastDate
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oExtraDatesVolume"; $_t_oldMethodName)
