If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]Stock_in.oITMButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/03/2013 12:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; SD_l_ProcID; STK_SubProcORDi)
	C_TEXT:C284($_t_oldMethodName; $STRItemNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oITMButton"; Form event code:C388)

If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
	$STRItemNumber:=String:C10([STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
	If (STK_SubProcORDi=0)
		SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Order Item"; Current process:C322; Table:C252(->[ORDER_ITEMS:25]); ""; $STRItemNumber)
		
		//ZOrderI_Mod ($STRItemNumber;"True";->STK_SubProcORDi)
	Else 
		$_l_ProcessState:=Process state:C330(STK_SubProcORDi)
		If ($_l_ProcessState<0)
			SD_l_ProcID:=New process:C317("DBI_DisplayRecord"; 64000; "Order Item"; Current process:C322; Table:C252(->[ORDER_ITEMS:25]); ""; $STRItemNumber)
			
			//ZOrderI_Mod ($STRItemNumber;"True";->STK_SubProcORDi)
		Else 
			BRING TO FRONT:C326(STK_SubProcORDi)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oITMButton"; $_t_oldMethodName)
