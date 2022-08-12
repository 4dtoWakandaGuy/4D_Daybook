//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_HL_Sort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RecordReferences; 0)
	//ARRAY LONGINT(SD_al_AppointmentRecordIDs;0)
	//ARRAY LONGINT(SD_al_EventRecordIDs;0)
	//ARRAY LONGINT(SD_al_ToDoRecordIDs;0)
	ARRAY TEXT:C222($_at_ListItemText; 0)
	//ARRAY TEXT(SD_at_AppointmentSort;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_Query;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	C_BOOLEAN:C305($_bo_SortAppointments; $_bo_SortEvents; $_bo_SortToDo)
	C_LONGINT:C283($_l_Index; $_l_OK; $_l_RecordNumber; $_l_RecordRow; SD_l_AppointmentsortDirection; SD_l_AppointmentSortOrder; SD_l_EventSortDirection; SD_l_EventSortOrder; SD_l_ToSortDirection; SD_l_ToSortOrder)
	C_PICTURE:C286(SD_Pic_AptSort; SD_Pic_EventSort; SD_Pic_ToDoSort)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_HL_Sort")
//if no params this will sort all 3
//if there are parameters
If (Count parameters:C259>=1)
	$_bo_SortEvents:=($1=1)
	$_bo_SortAppointments:=($1=2)
	$_bo_SortToDo:=($1=3)
Else 
	$_bo_SortEvents:=True:C214
	$_bo_SortAppointments:=True:C214
	$_bo_SortToDo:=True:C214
End if 
If (SD_l_ToSortOrder=0)
	SD_l_ToSortOrder:=1
	SD_l_ToSortDirection:=1  //reverse(newest first)
End if 
If (SD_l_AppointmentSortOrder=0)
	SD_l_AppointmentSortOrder:=1
	SD_l_AppointmentsortDirection:=1
End if 
If (SD_l_EventSortOrder=0)
	SD_l_EventSortOrder:=1
	SD_l_EventSortDirection:=0  //oldest first
End if 
//What we do here is
//Get a  selection using the arrays
//sort the selection
//SD_HL_SORT
//build an array with the texts in the correct order
//put this array into the list

If ($_bo_SortEvents)
	If (Size of array:C274(SD_al_EventRecordIDs)>0) & (SD_l_EventSortOrder<6)
		If (Records in table:C83([DIARY:12])>0)  //BSW 23/05/02 How can we create selection with new data file
			If (SD_al_EventRecordIDs{1}#-1)
				CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_EventRecordIDs)
				$_l_OK:=1
			Else 
				$_l_OK:=0
				REDUCE SELECTION:C351([DIARY:12]; 0)
			End if 
			
		End if 
		If ($_l_OK=1)
			Case of 
				: (SD_l_EventSortOrder=1)  //Date_Time
					If (SD_l_EventSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
					End if 
				: (SD_l_EventSortOrder=2)  //Priority
					If (SD_l_EventSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17; <)
						
					End if 
				: (SD_l_EventSortOrder=3)  //Action Code
					If (SD_l_EventSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9; <)
					End if 
					
				: (SD_l_EventSortOrder=5)  //Custom
					ORDER BY:C49([DIARY:12])
					SD_l_EventSortOrder:=6
			End case 
			//these are now sorted
			If (Records in selection:C76([DIARY:12])=0)
				//this would happen if they pressed cancel on a custom sort
				If ((Records in table:C83([DIARY:12])>0) & (Size of array:C274(SD_al_EventRecordIDs)>0))  //BSW 23/05/02 How can we create selection with new data file
					If (SD_al_EventRecordIDs{1}#-1)
						CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_EventRecordIDs)
					Else 
						REDUCE SELECTION:C351([DIARY:12]; 0)
					End if 
					
				End if 
			End if 
			ARRAY TEXT:C222($_at_ListItemText; Size of array:C274(SD_al_EventRecordIDs))
			ARRAY LONGINT:C221($_al_RecordReferences; Size of array:C274(SD_al_EventRecordIDs))
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				$_l_RecordNumber:=Record number:C243([DIARY:12])
				$_l_RecordRow:=Find in array:C230(SD_al_EventRecordIDs; $_l_RecordNumber)
				$_at_ListItemText{$_l_Index}:=SD_at_Events{$_l_RecordRow}
				$_al_RecordReferences{$_l_Index}:=SD_al_EventRecordIDs{$_l_RecordRow}
				NEXT RECORD:C51([DIARY:12])
			End for 
			//we now have an array of the sorted items
			For ($_l_Index; 1; Size of array:C274($_at_ListItemText))
				SD_at_Events{$_l_Index}:=$_at_ListItemText{$_l_Index}
				SD_al_EventRecordIDs{$_l_Index}:=$_al_RecordReferences{$_l_Index}
			End for 
		End if 
		
		
		
		
	End if 
	
	
End if 
If ($_bo_SortAppointments)
	If (Size of array:C274(SD_al_AppointmentRecordIDs)>0) & (SD_l_AppointmentSortOrder<18)
		If (Records in table:C83([DIARY:12])>0)  //BSW 23/05/02 How can we create selection with new data file
			If (SD_al_AppointmentRecordIDs{1}#-1)
				$_l_OK:=1
				CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_AppointmentRecordIDs)
			Else 
				$_l_OK:=0
				REDUCE SELECTION:C351([DIARY:12]; 0)
			End if 
			
		End if 
		If ($_l_OK=1)
			//```
			SD_at_AppointmentSort{8}:="Product Code"
			SD_at_AppointmentSort{9}:="Order Code"
			SD_at_AppointmentSort{10}:="Job Code"
			SD_at_AppointmentSort{11}:="Stage Code"
			SD_at_AppointmentSort{12}:="Document Code"
			SD_at_AppointmentSort{13}:="Result Code"
			SD_at_AppointmentSort{14}:="-"
			SD_at_AppointmentSort{15}:="Custom"
			//```
			Case of 
				: (SD_l_AppointmentSortOrder=1)  //Date_Time
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
					End if 
				: (SD_l_AppointmentSortOrder=2)  //Priority
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17; <)
						
					End if 
				: (SD_l_AppointmentSortOrder=3)  //Action Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9; <)
					End if 
				: (SD_l_AppointmentSortOrder=4)  //Result Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Result_Code:11)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Result_Code:11; <)
					End if 
				: (SD_l_AppointmentSortOrder=5)  //diary person
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Person:8)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Person:8; <)
					End if 
				: (SD_l_AppointmentSortOrder=6)  //Company Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Company_Code:1)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Company_Code:1; <)
					End if 
				: (SD_l_AppointmentSortOrder=7)  //Contact Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Contact_Code:2)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Contact_Code:2; <)
					End if 
				: (SD_l_AppointmentSortOrder=8)  //product Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Product_Code:13)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Product_Code:13; <)
					End if 
				: (SD_l_AppointmentSortOrder=9)  //order Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Order_Code:26)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Order_Code:26; <)
					End if 
					
				: (SD_l_AppointmentSortOrder=10)  //job Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19; <)
					End if 
				: (SD_l_AppointmentSortOrder=11)  //Stage Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Stage_Code:21)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Stage_Code:21; <)
					End if 
					
				: (SD_l_AppointmentSortOrder=12)  //Document Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Document_Code:15)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Document_Code:15; <)
					End if 
				: (SD_l_AppointmentSortOrder=13)  //Result Code
					If (SD_l_AppointmentsortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Result_Code:11)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Result_Code:11; <)
					End if 
					
				: (SD_l_AppointmentSortOrder=15)  //Custom
					ORDER BY:C49([DIARY:12])
					SD_l_AppointmentSortOrder:=18
					
			End case 
			//these are now sorted
			If ((Records in selection:C76([DIARY:12])=0) & (Records in table:C83([DIARY:12])>0))  //BSW 23/05/02 How can we create selection with new data file
				//this would happen if they pressed cancel on a custom sort
				If (SD_al_AppointmentRecordIDs{1}#-1)
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_AppointmentRecordIDs)
				Else 
					REDUCE SELECTION:C351([DIARY:12]; 0)
				End if 
				
			End if 
			ARRAY TEXT:C222($_at_ListItemText; Size of array:C274(SD_al_AppointmentRecordIDs))
			ARRAY LONGINT:C221($_al_RecordReferences; Size of array:C274(SD_al_AppointmentRecordIDs))
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				$_l_RecordNumber:=Record number:C243([DIARY:12])
				$_l_RecordRow:=Find in array:C230(SD_al_AppointmentRecordIDs; $_l_RecordNumber)
				$_at_ListItemText{$_l_Index}:=SD_at_Query{$_l_RecordRow}
				$_al_RecordReferences{$_l_Index}:=SD_al_AppointmentRecordIDs{$_l_RecordRow}
				NEXT RECORD:C51([DIARY:12])
			End for 
			//we now have an array of the sorted items
			For ($_l_Index; 1; Size of array:C274($_at_ListItemText))
				SD_at_Query{$_l_Index}:=$_at_ListItemText{$_l_Index}
				SD_al_AppointmentRecordIDs{$_l_Index}:=$_al_RecordReferences{$_l_Index}
			End for 
		End if 
		
	End if 
End if 

If ($_bo_SortToDo)
	If ((Size of array:C274(SD_al_ToDoRecordIDs)>0) & (SD_l_ToSortOrder<6) & (Records in table:C83([DIARY:12])>0))  //BSW 23/05/02 How can we create selection with new data file
		If (SD_al_ToDoRecordIDs{1}#-1)
			CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_ToDoRecordIDs)
			$_l_OK:=1
		Else 
			$_l_OK:=0
			REDUCE SELECTION:C351([DIARY:12]; 0)
		End if 
		If ($_l_OK=1)
			Case of 
				: (SD_l_ToSortOrder=1)  //Date_Time
					If (SD_l_ToSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
					End if 
				: (SD_l_ToSortOrder=2)  //Priority
					If (SD_l_ToSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Priority:17; <)
						
					End if 
				: (SD_l_ToSortOrder=3)  //Action Code
					If (SD_l_ToSortDirection=0)
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9)
					Else 
						ORDER BY:C49([DIARY:12]; [DIARY:12]Action_Code:9; <)
					End if 
					
				: (SD_l_ToSortOrder=5)  //Custom
					ORDER BY:C49([DIARY:12])
					SD_l_ToSortOrder:=6  //so it does not bring this up on an auto search
			End case 
			//these are now sorted
			If ((Records in selection:C76([DIARY:12])=0) & (Records in table:C83([DIARY:12])>0))  //BSW 23/05/02 How can we create selection with new data file
				//this would happen if they pressed cancel on a custom sort
				If (SD_al_ToDoRecordIDs{1}#-1)
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD_al_ToDoRecordIDs)
				Else 
					REDUCE SELECTION:C351([DIARY:12]; 0)
				End if 
				
			End if 
			ARRAY TEXT:C222($_at_ListItemText; Size of array:C274(SD_al_ToDoRecordIDs))
			ARRAY LONGINT:C221($_al_RecordReferences; Size of array:C274(SD_al_ToDoRecordIDs))
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				$_l_RecordNumber:=Record number:C243([DIARY:12])
				$_l_RecordRow:=Find in array:C230(SD_al_ToDoRecordIDs; $_l_RecordNumber)
				$_at_ListItemText{$_l_Index}:=SD_at_ToDoList{$_l_RecordRow}
				$_al_RecordReferences{$_l_Index}:=SD_al_ToDoRecordIDs{$_l_RecordRow}
				NEXT RECORD:C51([DIARY:12])
			End for 
			//we now have an array of the sorted items
			For ($_l_Index; 1; Size of array:C274($_at_ListItemText))
				SD_at_ToDoList{$_l_Index}:=$_at_ListItemText{$_l_Index}
				SD_al_ToDoRecordIDs{$_l_Index}:=$_al_RecordReferences{$_l_Index}
			End for 
		End if 
		
	End if 
End if 
//GET PICTURE FROM LIBRARY(22223-SD_l_ToSortDirection; SD_Pic_ToDoSort)
SD_Pic_ToDoSort:=Get_Picture(22223-SD_l_ToSortDirection)

//GET PICTURE FROM LIBRARY(22223-SD_l_EventSortDirection; SD_Pic_EventSort)
SD_Pic_EventSort:=Get_Picture(22223-SD_l_EventSortDirection)

//GET PICTURE FROM LIBRARY(22223-SD_l_AppointmentsortDirection; SD_Pic_AptSort)
SD_Pic_AptSort:=Get_Picture(22223-SD_l_AppointmentsortDirection)

ERR_MethodTrackerReturn("SD_HL_Sort"; $_t_oldMethodName)
