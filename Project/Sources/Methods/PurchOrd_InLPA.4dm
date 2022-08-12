//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2011 14:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(PO_at_RelatedType;0)
	//ARRAY TEXT(PO_at_RelatedEventCodes;0)
	C_BOOLEAN:C305(PO_bo_AddItem; PO_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_TableNumber; PO_l_FurtherFieldsMod)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PO_t_AddressLine1; PO_t_AddressLine2; PO_t_Country; PO_t_County; PO_t_PostalCode)
	C_TEXT:C284(PO_t_RelatedRecord; PO_t_RelatedRecordOLD; PO_t_Town)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_InLPA")
If (PO_bo_AddItem) | ([PURCHASE_ORDERS_ITEMS:169]ID:17#0)
	DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
End if 
PO_bo_AddItem:=False:C215

If (PO_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
	If (PO_l_FurtherFieldsMod>0)
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("PO_FFSelection")>0)
			USE SET:C118("PO_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		CLEAR SET:C117("PO_FFSelection")
		FUR_UpdateFurtherFields(->[PURCHASE_ORDERS:57])
		
		
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		//at least one further field has been modified
		
		
	End if 
	$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS:57])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	CLEAR SET:C117("PO_FFSelection")
End if 

If (PO_t_RelatedRecord#"")
	//First delete any other and check we don't already have this saved. not very sophisticated.
	//at this time only one event can be related to the PO..if we change that then we have to change here to not delete any other
	
	ARRAY TEXT:C222(PO_at_RelatedType; 0)
	ARRAY TEXT:C222(PO_at_RelatedEventCodes; 0)
	READ WRITE:C146([xOtherRelations:138])
	//LoadVirtualRelations (Table(->[PURCHASES]);"";1;Field(->[PURCHASES]Purchase Code);"";"PO_at_RelatedType";"PO_at_RelatedEventCodes")
	If (Size of array:C274(PO_at_RelatedEventCodes)>0)
		CREATE SET:C116([xOtherRelations:138]; "$Temp")
		//QUERY SELECTION([xOtherRelations];[xOtherRelations]xManyTableNum=Table(->[EVENTS]);*)
		//QUERY SELECTION([xOtherRelations]; & ;[xOtherRelations]xOneTableSTRreference#PO_at_RelatedEventCodes)
		If (Records in selection:C76([xOtherRelations:138])>0)
			DELETE SELECTION:C66([xOtherRelations:138])
			CLEAR SET:C117("$Temp")
			//SaveVirtualrelations (->[PURCHASE ORDERS]Purch Ord No;->[EVENTS]Event Code;1;->PO_at_RelatedEventCodes)
		Else 
			USE SET:C118("$Temp")
			CLEAR SET:C117("$Temp")
			//QUERY SELECTION([xOtherRelations];[xOtherRelations]xManyTableNum=Table(->[EVENTS]);*)
			//QUERY SELECTION([xOtherRelations]; & ;[xOtherRelations]xOneTableSTRreference=PO_at_RelatedEventCodes)
			If (Records in selection:C76([xOtherRelations:138])=0)
				//SaveVirtualrelations (->[PURCHASE ORDERS]Purch Ord No;->[EVENTS]Event Code;1;->PO_at_RelatedEventCodes)
			End if 
		End if 
	Else 
		//SaveVirtualrelations (->[PURCHASE ORDERS]Purch Ord No;->[EVENTS]Event Code;1;->PO_at_RelatedEventCodes)
	End if 
	UNLOAD RECORD:C212([xOtherRelations:138])
	READ ONLY:C145([xOtherRelations:138])
End if 
PO_SaveDeliveryAddress

DB_t_CurrentFormUsage:=""
ERR_MethodTrackerReturn("PurchOrd_InLPA"; $_t_oldMethodName)
