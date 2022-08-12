//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_Preview
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
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(vText)
	C_LONGINT:C283(WRITE_2)
	C_TEXT:C284(vText; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Preview")
//

Letter_Print2
vText:=""
Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
Letter_Replace
WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
//THIS IS THE WRONG COMMAND!!!
//WR O DO COMMAND (Write;115) No such command
//i think we want a print preview
WR EXECUTE COMMAND:P12000:113(Write_2; 107)

//WR Open_DocUMENT (Write;[DOCUMENTS]Write_)
//$WIN:=Open external window(40;40;740;Screen height-40;4;[DOCUMENTS]Document Code
//TRACE

WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
ERR_MethodTrackerReturn("Letter_Preview"; $_t_oldMethodName)
