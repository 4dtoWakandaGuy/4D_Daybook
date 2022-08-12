//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stock InCan
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2012 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ResetCalledOff; 0)
	//ARRAY LONGINT(STK_al_Reset;0)
	C_BOOLEAN:C305($_bo_Ready; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_LONGINT:C283($_l_Process; vAdd)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock InCan")
If (vAdd=1)
	// DB_SaveRecord(->[STOCK MOVEMENTS])
	// RELATE MANY([STOCK MOVEMENTS]Movement Code)
	//  DELETE SELECTION([STOCK ITEMS])
	//  DELETE RECORD([STOCK MOVEMENTS])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ResetCalledOff)
		Gen_Alert("Stock items you were copying from will be reset this may take up to two minutes, you will not be able to copy from them till this reset has happened"; "Continue")
		$_l_Process:=New process:C317("STK_ResetCalledOff"; 128000; "Reset called off"; False:C215)
		DelayTicks(20)
		
		
		If ($_l_Process>0)
			Repeat 
				DelayTicks(2)
				GET PROCESS VARIABLE:C371($_l_Process; STK_bo_RestReadytoreceive; $_bo_Ready)
			Until ($_bo_Ready)
			VARIABLE TO VARIABLE:C635($_l_Process; STK_al_Reset; $_al_ResetCalledOff)
			SET PROCESS VARIABLE:C370($_l_Process; STK_bo_RestReady; True:C214)
		End if 
	End if 
	CANCEL:C270
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("Stock InCan"; $_t_oldMethodName)
