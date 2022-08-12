//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Blob_to_Data
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($4; DB_bo_isTrue)
	C_DATE:C307(DB_d_Date)
	C_LONGINT:C283($_l_DataType; $_l_offset)
	C_POINTER:C301($1; $2)
	C_REAL:C285($0; $3; $5)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(DB_TI_TIME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Blob_to_Data")
$_l_offset:=$3
$_l_DataType:=-1
If (Count parameters:C259>=5)
	$_l_DataType:=$5
End if 

Case of 
	: (Type:C295($1->)=Is alpha field:K8:1) | (Type:C295($1->)=Is string var:K8:2)
		
		$1->:=BLOB to text:C555($2->; 2; $_l_offset)
		$0:=$_l_offset
	: (Type:C295($1->)=Is boolean:K8:9)
		BLOB TO VARIABLE:C533($2->; DB_bo_isTrue; $_l_offset)
		$1->:=DB_bo_isTrue
		$0:=$_l_offset
		
	: (Type:C295($1->)=Is date:K8:7)
		$1->:=DB_d_Date
		BLOB TO VARIABLE:C533($2->; DB_d_Date; $_l_offset)
		$1->:=DB_d_Date
		$0:=$_l_offset
		
	: (Type:C295($1->)=Is integer:K8:5) | ($_l_DataType=Is integer:K8:5)
		
		$1->:=BLOB to integer:C549($2->; Macintosh byte ordering:K22:2; $_l_offset)
		$0:=$_l_offset
		
	: (Type:C295($1->)=Is longint:K8:6)
		$1->:=BLOB to longint:C551($2->; Macintosh byte ordering:K22:2; $_l_offset)
		$0:=$_l_offset
	: (Type:C295($1->)=Is picture:K8:10)
		$0:=$3
	: (Type:C295($1->)=Is real:K8:4)
		$1->:=BLOB to real:C553($2->; Macintosh byte ordering:K22:2; $_l_offset)
		$0:=$_l_offset
		
	: (Type:C295($1->)=Is subtable:K8:11)
		$0:=$3
		
	: (Type:C295($1->)=Is text:K8:3)
		$1->:=BLOB to text:C555($2->; 2; $_l_offset)
		$0:=$_l_offset
		
	: (Type:C295($1->)=Is time:K8:8)
		DB_TI_TIME:=$1->
		
		BLOB TO VARIABLE:C533($2->; DB_TI_TIME; $_l_offset)
		$1->:=DB_TI_TIME
		$0:=$_l_offset
		
	Else 
		$0:=$3
		//TRACE
End case 
If (Count parameters:C259>=4)
	OBJECT SET ENTERABLE:C238($1->; $4)  //will prevent entry on screen
Else 
	OBJECT SET ENTERABLE:C238($1->; False:C215)  //will prevent entry on screen
	
End if 
ERR_MethodTrackerReturn("DB_Blob_to_Data"; $_t_oldMethodName)