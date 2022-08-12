//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetSourceButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_RelationMenuNums;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	C_LONGINT:C283($_l_Relation; BSource; BsourceC; BSourceContact)
	C_TEXT:C284($_t_oldMethodName; dl_ProductT; SD_t_JobName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetSourceButtons")
ARRAY TEXT:C222(SD_at_Arrayrelations; 0)
ARRAY LONGINT:C221(SD_al_RelationMenuNums; 0)
ARRAY TEXT:C222(SD_at_Arrayrelations; 20)
ARRAY LONGINT:C221(SD_al_RelationMenuNums; 20)

$_l_Relation:=0
If ([DIARY:12]Company_Code:1#"")
	OBJECT SET VISIBLE:C603(BsourceC; True:C214)
Else 
	OBJECT SET VISIBLE:C603(BsourceC; False:C215)
End if 
If ([DIARY:12]Contact_Code:2#"")
	OBJECT SET VISIBLE:C603(BSourceContact; True:C214)
Else 
	OBJECT SET VISIBLE:C603(BSourceContact; False:C215)
End if 
If ([DIARY:12]Job_Code:19#"")
	$_l_Relation:=$_l_Relation+1
	SD_al_RelationMenuNums{$_l_Relation}:=9
	SD_at_Arrayrelations{$_l_Relation}:="JOB: "+[DIARY:12]Job_Code:19+"  "+SD_t_JobName
	//SET VISIBLE(BSourceJob;True)
Else 
	// SET VISIBLE(BSourceJob;False)
End if 
If ([DIARY:12]Stage_Code:21#"")
	$_l_Relation:=$_l_Relation+1
	SD_al_RelationMenuNums{$_l_Relation}:=13
	SD_at_Arrayrelations{$_l_Relation}:="STAGE: "+[DIARY:12]Stage_Code:21
	//SET VISIBLE(BSourceStage;True)
Else 
	//SET VISIBLE(BSourceStage;False)
End if 
If ([DIARY:12]Order_Code:26#"")
	$_l_Relation:=$_l_Relation+1
	SD_al_RelationMenuNums{$_l_Relation}:=7
	SD_at_Arrayrelations{$_l_Relation}:="ORDER: "+[DIARY:12]Order_Code:26
	//SET VISIBLE(BSourceOrder;True)
Else 
	//SET VISIBLE(BSourceOrder;False)
End if 


If ([DIARY:12]Call_Code:25#"")
	$_l_Relation:=$_l_Relation+1
	SD_al_RelationMenuNums{$_l_Relation}:=8
	SD_at_Arrayrelations{$_l_Relation}:="CALL: "+[DIARY:12]Call_Code:25
	//SET VISIBLE(BSourceCall;True)
Else 
	//SET VISIBLE(BSourceCall;False)
End if 
If ([DIARY:12]Product_Code:13#"")
	$_l_Relation:=$_l_Relation+1
	SD_al_RelationMenuNums{$_l_Relation}:=5
	SD_at_Arrayrelations{$_l_Relation}:="PRODUCT: "+[DIARY:12]Product_Code:13+"  "+dl_ProductT
	//SET VISIBLE(BSourceProduct;True)
Else 
	// SET VISIBLE(BSourceProduct;False)
End if 
OBJECT SET ENABLED:C1123(bSource; ([DIARY:12]Data_Source_Table:49>0))
//If ([DIARY]Data_Source_Table>0)
//_O_ENABLE BUTTON(BSource)

//Else 
//_O_DISABLE BUTTON(BSource)
//End if 

ARRAY TEXT:C222(SD_at_Arrayrelations; $_l_Relation)
ARRAY LONGINT:C221(SD_al_RelationMenuNums; $_l_Relation)
ERR_MethodTrackerReturn("SD_SetSourceButtons"; $_t_oldMethodName)
