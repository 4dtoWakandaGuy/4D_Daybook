//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLPAPost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 20:38`Method: Move_InLPAPost
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TrackStockposting; STK_bo_ReversedPosting)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLPAPost")
RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
	If (([MOVEMENT_TYPES:60]Stock_Plus:3#"") | ([MOVEMENT_TYPES:60]Stock_Minus:4#""))
		DB_t_CurrentFormUsage:="LPA"
		If ([MOVEMENT_TYPES:60]UseForValueChange:28) | ([MOVEMENT_TYPES:60]UseForLocationMove:29) | ([MOVEMENT_TYPES:60]UseForLayerMove:31) | ([MOVEMENT_TYPES:60]UseForCurrencyMove:32) | ([MOVEMENT_TYPES:60]UseForAnalysisMove:30)
			STK_bo_ReversedPosting:=True:C214
			Move_InPost
			STK_bo_ReversedPosting:=False:C215
		End if 
		
		Move_InPost
		If (Not:C34(Is nil pointer:C315(Current default table:C363)))
			If (Table:C252(Current default table:C363)#Table:C252(->[ORDERS:24]))
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				READ ONLY:C145([ORDER_ITEMS:25])
			End if 
		End if 
		If (OK=1)
			[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
			ACCEPT:C269
		Else 
			If (DB_t_CurrentFormUsage#"TA")
				CANCEL:C270
			End if 
		End if 
	Else 
		[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
		ACCEPT:C269
	End if 
End if 
ERR_MethodTrackerReturn("Move_InLPAPost"; $_t_oldMethodName)