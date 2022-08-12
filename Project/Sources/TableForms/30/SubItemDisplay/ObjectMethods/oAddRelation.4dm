If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.oAddRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_Relations;0)
	//ARRAY TEXT(ACC_at_Relations;0)
	//ARRAY TEXT(ACC_at_RelationsCode;0)
	//ARRAY TEXT(ACC_at_RelationsName;0)
	//ARRAY TEXT(ACC_at_RelationTypes;0)
	C_LONGINT:C283(ACC_l_ItemViewContext; ACC_l_Relations)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oAddRelation"; Form event code:C388)
If (ACC_l_ItemViewContext=1) | (ACC_l_ItemViewContext=3)
	INSERT IN ARRAY:C227(ACC_at_Relations; 1)
	INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
	INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
	LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_at_Relations)  //Transcode
	OBJECT SET ENTERABLE:C238(ACC_at_Relations; True:C214)
	OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
	GOTO OBJECT:C206(*; "oTransItemRelations")
	
	LB_GoToCell(->ACC_LB_Relations; 1; 1)
	
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oAddRelation"; $_t_oldMethodName)
