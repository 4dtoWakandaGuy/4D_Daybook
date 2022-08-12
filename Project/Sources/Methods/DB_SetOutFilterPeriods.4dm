//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFilterPeriods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 11:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_PeriodFromFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodFromToDate;0)
	//ARRAY DATE(ACC_ad_PeriodToFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodToToDate;0)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodFromName;0)
	//ARRAY TEXT(ACC_at_PeriodToCode;0)
	//ARRAY TEXT(ACC_at_PeriodToName;0)
	C_BOOLEAN:C305($_bo_LayoutSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_ResetFilters; LAY_bo_InvPeriodsSetup; LAY_bo_OrdPeriodsSetup; LAY_bo_PeriodsSetup; LAY_bo_PIPeriodsSetup; LAY_bo_POPeriodsSetup; LAY_bo_STKIPeriodsSetup)
	C_LONGINT:C283($_l_DeleteTo; $_l_Index; $_l_MaxLBWidth; $_l_ObjectExists; $_l_PeriodUsed; $_l_Ref)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_DisplayThisObject; $_ptr_DropDownsToDisplay; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle; $_ptr_VarName)
	C_POINTER:C301($1; $10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodsLabel; $_t_SourcesLabel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutFilterPeriods")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	If (Count parameters:C259>=7)
		$_bo_SetReturnObjects:=True:C214
		$_ptr_objectNamedArray:=$2
		$_ptr_ObjectExists:=$3
		$_ptr_ObjectNameArray:=$4
		$_Ptr_ObjectsToDisplay:=$5  //pointer to array of object to display
		$_Ptr_DisplayThisObject:=$6  //pointer to boolean indicating if this object is displayed
		$_ptr_DropDownsToDisplay:=$7
		
		/////
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Periods")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Periods")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oAccDate")
		End if 
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oAccDate")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	
	Case of 
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_LayoutSetup:=LAY_bo_PeriodsSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			
			$_bo_LayoutSetup:=LAY_bo_OrdPeriodsSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
			
			$_bo_LayoutSetup:=LAY_bo_InvPeriodsSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
			
			$_bo_LayoutSetup:=LAY_bo_POPeriodsSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
			
			$_bo_LayoutSetup:=LAY_bo_PIPeriodsSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			$_bo_LayoutSetup:=LAY_bo_STKIPeriodsSetup
	End case 
	
	If (Not:C34($_bo_LayoutSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY TEXT:C222(ACC_at_PeriodFromCode; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterCMObject"; "oAccDateFrom"; ->ACC_at_PeriodFromCode)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccDateFromLabel")
			$_ptr_VarName:=OBJECT Get data source:C1265(*; "oAccDateFrom")
			
			$_t_PeriodsLabel:="Period From"
			If (Position:C15(":"; $_t_PeriodsLabel)=0)
				$_t_PeriodsLabel:=$_t_PeriodsLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oAccDateFromLabel"; $_t_PeriodsLabel)
			ARRAY TEXT:C222(ACC_at_PeriodToCode; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterCMObject"; "oAccDateTo"; ->ACC_at_PeriodToCode)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccDateToLabel")
			$_ptr_VarName:=OBJECT Get data source:C1265(*; "oAccDateTo")
			
			$_t_PeriodsLabel:="Period to"
			If (Position:C15(":"; $_t_PeriodsLabel)=0)
				$_t_PeriodsLabel:=$_t_PeriodsLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oAccDateToLabel"; $_t_PeriodsLabel)
			
		End if 
		
		
		ALL RECORDS:C47([PERIODS:33])
		ARRAY TEXT:C222(ACC_at_PeriodFromName; 0)
		ARRAY TEXT:C222(ACC_at_PeriodFromCode; 0)
		ARRAY DATE:C224(ACC_ad_PeriodFromFromDate; 0)
		ARRAY DATE:C224(ACC_ad_PeriodFromToDate; 0)
		SELECTION TO ARRAY:C260([PERIODS:33]Period_Name:2; ACC_at_PeriodFromName; [PERIODS:33]Period_Code:1; ACC_at_PeriodFromCode; [PERIODS:33]From_Date:3; ACC_ad_PeriodFromFromDate; [PERIODS:33]To_Date:4; ACC_ad_PeriodFromToDate)
		SORT ARRAY:C229(ACC_ad_PeriodFromFromDate; ACC_ad_PeriodFromToDate; ACC_at_PeriodFromName; ACC_at_PeriodFromCode; <)
		$_l_DeleteTo:=0
		$_l_PeriodUsed:=0
		Case of 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5<=ACC_ad_PeriodFromFromDate{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Date:3<=ACC_at_PeriodFromName{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([INVOICES:39]; [INVOICES:39]Period_Code:13=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
				For ($_l_Index; 1; Size of array:C274(ACC_at_PeriodFromCode))
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Period:42=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=Size of array:C274(ACC_at_PeriodFromCode)
					Else 
						$_l_DeleteTo:=$_l_Index
					End if 
				End for 
		End case 
		If ($_l_DeleteTo>0)
			For ($_l_Index; $_l_DeleteTo; 1; -1)
				DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
				DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
				DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
				DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
			End for 
		End if 
		Case of 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5>=ACC_ad_PeriodFromToDate{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
				
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Date:3>=ACC_ad_PeriodFromToDate{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([INVOICES:39]; [INVOICES:39]Period_Code:13=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
				For ($_l_Index; Size of array:C274(ACC_at_PeriodFromCode); 1; -1)
					SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PeriodUsed)
					
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Period:42=ACC_at_PeriodFromCode{$_l_Index})
					SET QUERY DESTINATION:C396(Into current selection:K19:1)
					
					If ($_l_PeriodUsed>0)
						$_l_Index:=0
					Else 
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromName; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_at_PeriodFromCode; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromFromDate; $_l_Index)
						DELETE FROM ARRAY:C228(ACC_ad_PeriodFromToDate; $_l_Index)
					End if 
				End for 
		End case 
		COPY ARRAY:C226(ACC_at_PeriodFromName; ACC_at_PeriodToName)
		COPY ARRAY:C226(ACC_at_PeriodFromCode; ACC_at_PeriodToCode)
		COPY ARRAY:C226(ACC_ad_PeriodFromFromDate; ACC_ad_PeriodToFromDate)
		COPY ARRAY:C226(ACC_ad_PeriodFromToDate; ACC_ad_PeriodToToDate)
		SORT ARRAY:C229(ACC_ad_PeriodToToDate; ACC_ad_PeriodToFromDate; ACC_at_PeriodToName; ACC_at_PeriodToCode; <)
		If (Size of array:C274(ACC_at_PeriodFromCode)>0)
			ACC_at_PeriodFromCode:=1
			ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
			ACC_at_PeriodToCode:=1
			ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{1}
		Else 
			ACC_at_PeriodFromCode{0}:=""
			ACC_at_PeriodToCode{0}:=""
		End if 
		LAY_bo_PeriodsSetup:=False:C215
		LAY_bo_OrdPeriodsSetup:=False:C215
		LAY_bo_InvPeriodsSetup:=False:C215
		LAY_bo_POPeriodsSetup:=False:C215
		LAY_bo_PIPeriodsSetup:=False:C215
		LAY_bo_STKIPeriodsSetup:=False:C215
		Case of 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
				LAY_bo_PeriodsSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
				LAY_bo_OrdPeriodsSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
				LAY_bo_InvPeriodsSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
				LAY_bo_POPeriodsSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
				LAY_bo_PIPeriodsSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
				LAY_bo_STKIPeriodsSetup:=True:C214
		End case 
		
		//ACC_ad_PeriodFrom
	Else 
		If (DB_bo_ResetFilters)
			ACC_at_PeriodFromCode:=1
			ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
			ACC_at_PeriodToCode:=1
			ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{1}
			
		End if 
	End if 
	
	If ($_bo_SetReturnObjects)
		$_ptr_DropDownsToDisplay->:=$_ptr_DropDownsToDisplay->+2
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Periods")
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFilterPeriods"; $_t_oldMethodName)