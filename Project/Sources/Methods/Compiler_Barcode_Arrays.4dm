//%attributes = {"invisible":true}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/08/2009 16:48
	//Method Name: Compiler_Barcode_Arrays
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_Barcode_Arrays")

ARRAY TEXT:C222(BARC_at_Patterns; 0)
ARRAY TEXT:C222(BARC_at_Patterns2; 0)
ARRAY LONGINT:C221(BARC_al_Checksums; 0)
ARRAY INTEGER:C220(BARC_al_Checksums2; 0)

ERR_MethodTrackerReturn("Compiler_Barcode_Arrays"; $_t_oldMethodName)