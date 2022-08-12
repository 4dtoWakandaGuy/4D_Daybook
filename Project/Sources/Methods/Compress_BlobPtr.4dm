//%attributes = {}
If (False:C215)
	//Project Method Name:      Compress_BlobPtr
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
	C_LONGINT:C283($_l_Compressed)
	C_POINTER:C301($_blb_Pointer; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Compress_BlobPtr")

$_blb_Pointer:=$1

Case of 
	: (Is nil pointer:C315($_blb_Pointer))
		//do nothing as pointer is nil
		
	: (Type:C295($_blb_Pointer->)#Is BLOB:K8:12)
		//do nothing as ptr data type is not blob
		
	: (BLOB size:C605($_blb_Pointer->)=0)
		//do nothing as blob size is zero
		
	Else 
		BLOB PROPERTIES:C536($_blb_Pointer->; $_l_Compressed)  //get blob properties
		If ($_l_Compressed=Is not compressed:K22:11)
			COMPRESS BLOB:C534($_blb_Pointer->)
		End if 
End case 
ERR_MethodTrackerReturn("Compress_BlobPtr"; $_t_oldMethodName)