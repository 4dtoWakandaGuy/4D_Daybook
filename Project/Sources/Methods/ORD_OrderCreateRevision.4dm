//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_OrderCreateRevision
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldIndex; $_l_RecordsIndex; $_l_RevisionNumber)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_OrderCreateRevision")
//TRACE
If (Count parameters:C259>=1)
	If ($1#"")
		READ ONLY:C145([XOrder_revisions:127])
		
		//$1=The order Code
		//this will put the current data of the order into a new revision
		QUERY:C277([XOrder_revisions:127]; [XOrder_revisions:127]X_OrderCode:4=$1)
		If (Records in selection:C76([XOrder_revisions:127])=0)
			$_l_RevisionNumber:=0
		Else 
			ORDER BY:C49([XOrder_revisions:127]; [XOrder_revisions:127]X_RevisionNumber:2; <)
			FIRST RECORD:C50([XOrder_revisions:127])
			$_l_RevisionNumber:=[XOrder_revisions:127]X_RevisionNumber:2+1
			UNLOAD RECORD:C212([XOrder_revisions:127])
		End if 
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$1)
		If (Records in selection:C76([ORDERS:24])>0)
			READ WRITE:C146([XOrder_revisions:127])
			
			CREATE RECORD:C68([XOrder_revisions:127])
			[XOrder_revisions:127]X_RevisionNumber:2:=$_l_RevisionNumber
			[XOrder_revisions:127]X_RevisionDate:3:=Current date:C33(*)
			[XOrder_revisions:127]X_OrderCode:4:=$1
			[XOrder_revisions:127]X_OrderID:5:=[ORDERS:24]x_ID:58
			[XOrder_revisions:127]x_OrderFieldCount:7:=Get last field number:C255(->[ORDERS:24])
			[XOrder_revisions:127]x_OrderItemFieldCount:8:=Get last field number:C255(->[ORDER_ITEMS:25])
			
			SET BLOB SIZE:C606([XOrder_revisions:127]X_OrderData:6; 0)
			For ($_l_FieldIndex; 1; Get last field number:C255(->[ORDERS:24]))
				$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_l_FieldIndex)
				DB_Data_to_Blob($_ptr_Field; ->[XOrder_revisions:127]X_OrderData:6; -1)
			End for 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$1)
			FIRST RECORD:C50([ORDER_ITEMS:25])
			For ($_l_RecordsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
				For ($_l_FieldIndex; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
					$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_FieldIndex)
					DB_Data_to_Blob($_ptr_Field; ->[XOrder_revisions:127]X_OrderData:6; -1)
				End for 
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
			DB_SaveRecord(->[XOrder_revisions:127])
			AA_CheckFileUnlocked(->[XOrder_revisions:127]X_ID:1)
			UNLOAD RECORD:C212([XOrder_revisions:127])
			READ ONLY:C145([XOrder_revisions:127])
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ORD_OrderCreateRevision"; $_t_oldMethodName)