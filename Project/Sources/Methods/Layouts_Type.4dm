//%attributes = {}
If (False:C215)
	//Project Method Name:      Layouts_Type
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/11/2010 09:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber; $_l_Type)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layouts_Type")
//Layouts_Type

$_l_TableNumber:=Num:C11(Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 1; 3))
Case of 
	: (([LIST_LAYOUTS:96]Table_Number:2>0) & ([LIST_LAYOUTS:96]Field_Number:3>0))
		If (Not:C34(Is field number valid:C1000([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)))
			
			[LIST_LAYOUTS:96]Field_Number:3:=1
		End if 
		
		$_l_Type:=Type:C295(Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)->)
		Case of 
			: ($_l_Type=13)
				$0:="Text  (Max 2)"
			: (($_l_Type=0) | ($_l_Type=24))
				$0:="String  (Max 15)"
			: ($_l_Type=2)
				$0:="Text  (Max 2)"
			: ($_l_Type=1)
				$0:="Real  (Max 9)"
			: ($_l_Type=4)
				$0:="Date  (Max 4)"
			: ($_l_Type=6)
				$0:="Boolean  (Max 2)"
			: ($_l_Type=8)
				$0:="Integer  (Max 4)"
			: (($_l_Type=9) | ($_l_Type=11))
				$0:="Long Integer  (Max 4)"
			: ($_l_Type=7)  //this wont be happening now
				$0:="Subfile: Please specify the Field in the Formula below"
				If (Count parameters:C259>=1)  //ADDED NG FEB 2004
					$1->:=True:C214
				End if 
				
			Else 
				$0:="Invalid Field Type: "+String:C10($_l_Type)
		End case 
	: ([LIST_LAYOUTS:96]X_associatedArrayName:17#"")
		
		$0:="Direct Array Display"
		
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Layouts_Type"; $_t_oldMethodName)