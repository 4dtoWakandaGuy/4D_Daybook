If (False:C215)
	//object Name: [USER]JOB_PermConfig.oQualsADD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305(JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_event; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.oQualsADD"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		JOB_bo_ConfigisModified:=True:C214
		$_l_SizeofArray:=Size of array:C274(QV_at_QualitySubGroupsNM)+1
		INSERT IN ARRAY:C227(QV_at_QualitySubGroupsNM; $_l_SizeofArray; 1)
		
		INSERT IN ARRAY:C227(QV_al_QualitySubGroupsIDs; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227(QV_at_QualitySubGroups; $_l_SizeofArray; 1)
		
		OBJECT SET ENTERABLE:C238(QV_at_QualitySubGroupsNM; True:C214)
		QV_al_QualitySubGroupsIDs{$_l_SizeofArray}:=-(AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3))
		EDIT ITEM:C870(QV_at_QualitySubGroupsNM; $_l_SizeofArray)
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.oQualsADD"; $_t_oldMethodName)
