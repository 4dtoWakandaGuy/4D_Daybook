//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Data_to_Blob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:17`Method: DB_Data_to_Blob
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_isTrue)
	C_DATE:C307(DB_d_Date)
	C_LONGINT:C283($3)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(DB_TI_TIME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Data_to_Blob")

Case of 
	: (Type:C295($1->)=Is alpha field:K8:1)
		If ($3=-1)
			TEXT TO BLOB:C554($1->; $2->; 2; *)
		Else 
			TEXT TO BLOB:C554($1->; $2->; 2; $3)
		End if 
		
	: (Type:C295($1->)=Is boolean:K8:9)
		DB_bo_isTrue:=$1->
		If ($3=-1)
			VARIABLE TO BLOB:C532(DB_bo_isTrue; $2->; *)
		Else 
			VARIABLE TO BLOB:C532(DB_bo_isTrue; $2->; $3)
		End if 
		
	: (Type:C295($1->)=Is date:K8:7)
		DB_d_Date:=$1->
		If ($3=-1)
			VARIABLE TO BLOB:C532(DB_d_Date; $2->; *)
		Else 
			VARIABLE TO BLOB:C532(DB_d_Date; $2->; $3)
		End if 
	: (Type:C295($1->)=Is integer:K8:5)
		If ($3=-1)
			INTEGER TO BLOB:C548($1->; $2->; Macintosh byte ordering:K22:2; *)
		Else 
			INTEGER TO BLOB:C548($1->; $2->; Macintosh byte ordering:K22:2; $3)
			
		End if 
		
	: (Type:C295($1->)=Is longint:K8:6)
		If ($3=-1)
			LONGINT TO BLOB:C550($1->; $2->; Macintosh byte ordering:K22:2; *)
		Else 
			LONGINT TO BLOB:C550($1->; $2->; Macintosh byte ordering:K22:2; $3)
			
		End if 
		
	: (Type:C295($1->)=Is picture:K8:10)
	: (Type:C295($1->)=Is real:K8:4)
		If ($3=-1)
			REAL TO BLOB:C552($1->; $2->; Macintosh byte ordering:K22:2; *)
		Else 
			REAL TO BLOB:C552($1->; $2->; Macintosh byte ordering:K22:2; $3)
		End if 
		
		
	: (Type:C295($1->)=Is subtable:K8:11)
	: (Type:C295($1->)=Is text:K8:3)
		If ($3=-1)
			TEXT TO BLOB:C554($1->; $2->; 2; *)
		Else 
			TEXT TO BLOB:C554($1->; $2->; 2; $3)
		End if 
	: (Type:C295($1->)=Is time:K8:8)
		DB_TI_TIME:=$1->
		If ($3=-1)
			VARIABLE TO BLOB:C532(DB_TI_TIME; $1->; *)
		Else 
			VARIABLE TO BLOB:C532(DB_TI_TIME; $1->; $3)
		End if 
		
	Else 
		//TRACE
End case 
ERR_MethodTrackerReturn("DB_Data_to_Blob"; $_t_oldMethodName)