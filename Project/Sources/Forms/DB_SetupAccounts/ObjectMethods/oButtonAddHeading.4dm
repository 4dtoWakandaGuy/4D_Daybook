If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oButtonAddHeading
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2013 09:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	//ARRAY PICTURE(DB_api_AddAccount;0)
	//ARRAY PICTURE(DB_api_AddSubHeading;0)
	//ARRAY PICTURE(DB_apic_AddAccount;0)
	//ARRAY PICTURE(DB_apic_AddSubHeading;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_SizeofArray)
	C_PICTURE:C286($_pic_AddSubHeading)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oButtonAddHeading"; Form event code:C388)

Gen_Confirm("Add New Account Heading?"; "No"; "Yes")
If (OK=0)
	//GET PICTURE FROM LIBRARY(22563; $_pic_AddSubHeading)
	$_pic_AddSubHeading:=Get_Picture(22563)
	TRANSFORM PICTURE:C988($_pic_AddSubHeading; Translate:K61:3; 3; 3)
	$_l_SizeofArray:=Size of array:C274(DB_apic_AddSubHeading)
	LISTBOX INSERT ROWS:C913(*; "oAccountHeadings1"; $_l_SizeofArray+1; 1)
	DB_apic_AddSubHeading{Size of array:C274(DB_apic_AddSubHeading)}:=$_pic_AddSubHeading
	DB_apic_AddAccount{Size of array:C274(DB_apic_AddSubHeading)}:=$_pic_AddSubHeading
	
	LB_SetEnterable(->ACC_lb_Headings; True:C214; 2)
	//
	//OBJECT GOTO AREA
	GOTO OBJECT:C206(*; "oAccountHeadings1")
	LISTBOX SELECT ROW:C912(*; "oAccountHeadings1"; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	Gen_Alert("Daybook Accounts are seperated into headings for reporting purposes. Please enter a Heading code for this Accounts Group Heading.")
	EDIT ITEM:C870(*; $_at_ColumnNames{2}; $_l_SizeofArray+1)
	OBJECT SET VISIBLE:C603(*; "oclearScreen"; True:C214)
	
End if 
OK:=1
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oButtonAddHeading"; $_t_oldMethodName)
