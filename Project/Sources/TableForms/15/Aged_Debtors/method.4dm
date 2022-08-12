If (False:C215)
	//Table Form Method Name: [USER]Aged_Debtors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_ADShowDepositDate; ACC_bo_ADShowExport; ACC_bo_ExportToDisk; ACC_bo_IgnoreDepositDate; ACC_bo_ShowDate; DB_bo_NoLoad)
	C_DATE:C307(Acc_D_CutOffDate)
	C_LONGINT:C283($_l_ButtonHeight; $_l_ButtonTop; $_l_event; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2)
	C_LONGINT:C283(VcDateFupDown; VDateFupDown)
	C_REAL:C285(Acc_R_Cutoffamount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [USER]Aged_Debtors"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Aged_Debtors")
		SET WINDOW TITLE:C213("Report Options")
		
		
		Acc_D_CutOffDate:=!00-00-00!
		Acc_R_Cutoffamount:=0
		ACC_bo_IgnoreDepositDate:=False:C215
		If (ACC_bo_ADShowDepositDate)
			OBJECT SET VISIBLE:C603(*; "oignoredepositdate"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oignoredepositdate"; False:C215)
		End if 
		//TRACE
		If (ACC_bo_ShowDate=False:C215)
			//hide the as at date and debtors account
			//Set the as at
			OBJECT GET COORDINATES:C663(*; "oasAtOptions1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oFilterOptionsLabel1"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oFilterOptionsLabel1"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
			
			OBJECT GET COORDINATES:C663(*; "oasAtOptionsUpDown"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oFilterOptionsUpDown"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oFilterOptionsUpDown"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
			
			
			
			
			
			OBJECT GET COORDINATES:C663(*; "oasAtOptions4"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oFilterOptions1"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oFilterOptions1"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
			
			OBJECT GET COORDINATES:C663(*; "oasAtOptions2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oFilterOptionsLabel2"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oFilterOptionsLabel2"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
			
			OBJECT GET COORDINATES:C663(*; "oasAtOptions5"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oFilterOptions2"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oFilterOptions2"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
			$_l_ButtonTop:=$_l_ObjectBottom+10
			OBJECT GET COORDINATES:C663(*; "oOptionsButton"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ButtonHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oOptionsButton"; $_l_ObjectLeft2; $_l_ButtonTop; $_l_ObjectRight2; ($_l_ButtonTop+$_l_ButtonHeight); *)
			
			OBJECT SET VISIBLE:C603(*; "oasAtOptions@"; False:C215)
			WS_AutoscreenSize(3; ($_l_ButtonTop+$_l_ButtonHeight)+20; 320)
		Else 
			WS_AutoscreenSize(3; 220; 320)
		End if 
		ACC_bo_ExportToDisk:=False:C215
		If (Not:C34(ACC_bo_ADShowExport))
			OBJECT SET VISIBLE:C603(*; "oExporttoDisc"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oExporttoDisc"; True:C214)
		End if 
		//OBJECT SET VISIBLE(*;"oFilterOptions1";True)
		
		ACC_bo_ADShowExport:=False:C215
		VDateFupDown:=0
		VcDateFupDown:=0
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM:Aged_Debtors"; $_t_oldMethodName)
