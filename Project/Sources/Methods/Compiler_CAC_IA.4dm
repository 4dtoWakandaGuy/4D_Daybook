//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_CAC_IA
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_CAC_IA")
// Compiler_CAC_IA

ARRAY TEXT:C222(<>CAC_at_CacheIndex; 0)
ARRAY PICTURE:C279(<>CAC_apic_CachePicture; 0)
ARRAY REAL:C219(<>CAC_ar_CacheExpirationMS; 0)

//for some tables only
ARRAY TEXT:C222(<>CAC_at_CacheIndex2; 0)
ARRAY TEXT:C222(<>CAC_at_CacheIndex3; 0)

//for 4D ArrayIndex method only
ARRAY LONGINT:C221(<>CAC_al_CacheLongint; 0)  //generically named because it might be used for >1 purpose
ARRAY LONGINT:C221(<>CAC_Al_CacheTableNum; 0)


// End Compiler_CAC_IA


ERR_MethodTrackerReturn("Compiler_CAC_IA"; $_t_oldMethodName)