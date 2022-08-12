//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_UpdateDefinitions
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
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	C_LONGINT:C283($_l_ColumnWIdth; $_l_FIeldNumber; $_l_FIeldNumber2; $_l_FIeldNumber3; $_l_FIeldNumber4; $_l_Index; $_l_NumberofColumns; $_l_OrderIndex; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_UpdateDefinitions")

//NG Feb 2008 this method is to update the [list layouts]
//This is needed because despite providing a way to enter a whole name and display same and display whole email address...people do not revise their definitions
READ WRITE:C146([LIST_LAYOUTS:96])
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="")
DELETE SELECTION:C66([LIST_LAYOUTS:96])

$_l_TableNumber:=Table:C252(->[CONTACTS:1])
$_l_FIeldNumber:=Field:C253(->[CONTACTS:1]Forename:4)
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Table_Number:2=$_l_TableNumber; *)
QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber)
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	ARRAY TEXT:C222($_at_LayoutRefs; 0)
	DISTINCT VALUES:C339([LIST_LAYOUTS:96]Layout_Reference:1; $_at_LayoutRefs)
	$_l_NumberofColumns:=Size of array:C274($_at_LayoutRefs)
	READ WRITE:C146([LIST_LAYOUTS:96])
	For ($_l_Index; 1; $_l_NumberofColumns)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
		QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber)
		$_l_ColumnWIdth:=[LIST_LAYOUTS:96]Width:5
		$_l_FIeldNumber3:=Field:C253(->[CONTACTS:1]Title:3)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
		QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber3)
		$_l_ColumnWIdth:=$_l_ColumnWIdth+[LIST_LAYOUTS:96]Width:5
		$_l_FIeldNumber4:=Field:C253(->[CONTACTS:1]Qualifications:13)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
		QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber4)
		$_l_ColumnWIdth:=$_l_ColumnWIdth+[LIST_LAYOUTS:96]Width:5
		$_l_FIeldNumber2:=Field:C253(->[CONTACTS:1]Surname:5)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
		QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber2)
		If (Records in selection:C76([LIST_LAYOUTS:96])>0)
			// This definition includes first and surname
			[LIST_LAYOUTS:96]Field_Number:3:=Field:C253(->[CONTACTS:1]Contact_Name:31)
			[LIST_LAYOUTS:96]Width:5:=[LIST_LAYOUTS:96]Width:5+$_l_ColumnWIdth
			DB_SaveRecord(->[LIST_LAYOUTS:96])
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
			QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber)
			If (Records in selection:C76([LIST_LAYOUTS:96])>=1)
				DELETE RECORD:C58([LIST_LAYOUTS:96])
			End if 
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
			QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber3)
			If (Records in selection:C76([LIST_LAYOUTS:96])>=1)
				DELETE SELECTION:C66([LIST_LAYOUTS:96])
			End if 
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index}; *)
			QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=$_l_FIeldNumber4)
			If (Records in selection:C76([LIST_LAYOUTS:96])>=1)
				DELETE SELECTION:C66([LIST_LAYOUTS:96])
			End if 
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutRefs{$_l_Index})
			ORDER BY:C49([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7)
			FIRST RECORD:C50([LIST_LAYOUTS:96])
			For ($_l_OrderIndex; 1; Records in selection:C76([LIST_LAYOUTS:96]))
				[LIST_LAYOUTS:96]Order:7:=$_l_OrderIndex
				DB_SaveRecord(->[LIST_LAYOUTS:96])
				NEXT RECORD:C51([LIST_LAYOUTS:96])
			End for 
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("DB_UpdateDefinitions"; $_t_oldMethodName)