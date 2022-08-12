//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InLEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(wr view menubar)
	//C_UNKNOWN(wr view references)
	//C_UNKNOWN(wr view rulers)
	C_LONGINT:C283(vEdit; Write)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLEdit")

Menu_Record("Diary_InLEdit"; "Switch Read/Write")
Case of 
	: (Documents_4DWriteAccessType(False:C215)="W@")
		If (vEdit=1)
			WR TEXT ACCESS:P12000:42(Write; 1)
			vEdit:=0
			//    SET ITEM(2051;5;"Edit Text")
		Else 
			WR TEXT ACCESS:P12000:42(Write; 0)
			//WR O DISPLAY RULER (Write;0)
			//NG April 2000 update to 4D write 655-replaced above command
			
			WR SET DOC PROPERTY:P12000:109(Write; wr view rulers:K12003:3; 0)
			// WR O DISPLAY MENUBAR (Write;0)
			//NG April 2000 update to 4D write 655-replaced above command
			WR SET DOC PROPERTY:P12000:109(Write; wr view menubar:K12003:11; 0)
			WR SET DOC PROPERTY:P12000:109(WRITE; wr view references:K12003:17; 0)
			WR REDRAW:P12000:10(Write)
			vEdit:=1
			// SET ITEM(2051;5;"Read Only Text")
		End if 
		//  : (◊Write="SW") SuperWrite out 24/04/02 pb
		//  If (vEdit=1)
		//    $pos:=SW Options (Write;0;0;0;0;1;1;0)
		//    $r:=SW Area Mode (Write;1;1)
		//    vEdit:=0
		// Else
		//    $pos:=SW Options (Write;0;0;0;1;1;1;0)
		//   $r:=SW Area Mode (Write;1;2)
		//   vEdit:=1
		// End if
	Else 
		If (vEdit=1)
			OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; False:C215)
			OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
			vEdit:=0
			//  SET ITEM(2051;5;"Edit Text")
		Else 
			OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; True:C214)
			OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; True:C214)
			vEdit:=1
			//   SET ITEM(2051;5;"Read Only Text")
		End if 
End case 
ERR_MethodTrackerReturn("Diary_InLEdit"; $_t_oldMethodName)