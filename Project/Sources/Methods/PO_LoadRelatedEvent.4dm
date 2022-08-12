//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_LoadRelatedEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PO_at_RelatedEventCodes;0)
	//ARRAY TEXT(PO_at_RelatedType;0)
	C_TEXT:C284($_t_oldMethodName; PO_t_RelatedRecord; PO_t_RelatedRecordOLD; PORelatedRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_LoadRelatedEvent")
//This will hide if the events module is not in licence
ARRAY TEXT:C222(PO_at_RelatedType; 0)
ARRAY TEXT:C222(PO_at_RelatedEventCodes; 0)
//NG Rather than delete this with the events i am setting it to invisible it could be used for another relataion

LoadVirtualRelations(Table:C252(->[PURCHASE_INVOICES:37]); ""; 1; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); ""; "PO_at_RelatedType"; "PO_at_RelatedEventCodes")
If (Size of array:C274(PO_at_RelatedEventCodes)>0)
	PO_t_RelatedRecord:=PO_at_RelatedEventCodes{1}
	PO_t_RelatedRecordOLD:=PO_t_RelatedRecord
	PORelatedRec:=PO_at_RelatedType{1}
Else 
	PO_t_RelatedRecord:=""
	PO_t_RelatedRecordOLD:=PO_t_RelatedRecord
	PORelatedRec:="Event Code"
End if 
OBJECT SET VISIBLE:C603(*; "oRelatedRecordLabel"; False:C215)
OBJECT SET VISIBLE:C603(PO_t_RelatedRecord; False:C215)
ERR_MethodTrackerReturn("PO_LoadRelatedEvent"; $_t_oldMethodName)