If (False:C215)
	//Project Form Method Name: OI_CopyAssign
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 11:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(OI_At_Date;0)
	//ARRAY LONGINT(OI_al_ItemNumber;0)
	ARRAY TEXT:C222($_at_JobStageNames; 0)
	ARRAY TEXT:C222($_at_JobStages; 0)
	//ARRAY TEXT(OI_At_Description;0)
	//ARRAY TEXT(OI_at_JobStage;0)
	//ARRAY TEXT(OI_at_JobStageName;0)
	//ARRAY TEXT(OI_at_ProductCode;0)
	//ARRAY TEXT(OI_at_ProductName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_ItemIndex; $_l_StageRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM OI_CopyAssign"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222($_at_JobStages; 0)
		ARRAY TEXT:C222($_at_JobStageNames; 0)
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; OI_al_ItemNumber; [ORDER_ITEMS:25]Job_Stage:35; OI_at_JobStage; [ORDER_ITEMS:25]Product_Code:2; OI_at_ProductCode; [ORDER_ITEMS:25]Product_Name:13; OI_at_ProductName; [ORDER_ITEMS:25]Description:44; OI_At_Description; [ORDER_ITEMS:25]Required_Date:10; OI_At_Date)
		
		ARRAY TEXT:C222(OI_at_JobStageName; Size of array:C274(OI_at_JobStage))
		For ($_l_ItemIndex; 1; Size of array:C274(OI_al_ItemNumber))
			$_l_StageRow:=Find in array:C230($_at_JobStages; OI_at_JobStage{$_l_ItemIndex})
			If ($_l_StageRow<0)
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=OI_at_JobStage{$_l_ItemIndex})
				APPEND TO ARRAY:C911($_at_JobStages; OI_at_JobStage{$_l_ItemIndex})
				APPEND TO ARRAY:C911($_at_JobStageNames; [JOB_STAGES:47]Stage_Name:3)
				$_l_StageRow:=Find in array:C230($_at_JobStages; OI_at_JobStage{$_l_ItemIndex})
			End if 
			OI_at_JobStageName{$_l_ItemIndex}:=$_at_JobStageNames{$_l_StageRow}
			
		End for 
End case 
ERR_MethodTrackerReturn("FM OI_CopyAssign"; $_t_oldMethodName)
