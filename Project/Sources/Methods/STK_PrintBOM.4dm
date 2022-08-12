//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_PrintBOM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 10:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ComponentLevels; $_l_DefaultLevels; $_l_OK; DB_l_CurrentDisplayedForm; r1; r2; s1; s2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_PrintBOM")
CREATE SET:C116([PRODUCTS:9]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([PRODUCTS:9])>0)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		
		$_l_DefaultLevels:=10
		$_l_ComponentLevels:=Gen_RequestAmount("Maximum Component Levels:"; $_l_DefaultLevels)
		If (OK=1)
			If (($_l_ComponentLevels<1) | ($_l_ComponentLevels>10))
				Gen_Alert("The Maximum must be between 1 and 10, and has now been set to 10"; "OK")
				$_l_ComponentLevels:=10
			End if 
			$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Bill of Materials")
			If ($_l_OK>=0)
				CREATE RECORD:C68([STOCK_MOVEMENTS:40])
				[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
				Move_InLPBDef
				Move_InType
				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=$_l_ComponentLevels
				s1:=0
				s2:=0
				r1:=0
				r2:=0
				FIRST RECORD:C50([PRODUCTS:9])
				While (Not:C34(End selection:C36([PRODUCTS:9])))
					Print form:C5([STOCK_MOVEMENT_ITEMS:27]; "StockAss_BoMHdr")
					[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[PRODUCTS:9]Product_Code:1
					CUT NAMED SELECTION:C334([PRODUCTS:9]; "$BoM")
					DB_t_CurrentFormUsage:="Display"
					StockAss_Calc
					StockAss_BoM2  //Also used in StockAss_AvailP
					USE NAMED SELECTION:C332("$BoM")
					NEXT RECORD:C51([PRODUCTS:9])
				End while 
				PRT_SetPrinterPaperOptions("Bill of Materials")  //NG June 2005
				
				
			End if 
		End if 
	Else 
		Gen_Alert("No Movement Type has been specified as being used for Assemblies"; "Cancel")
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("STK_PrintBOM"; $_t_oldMethodName)
