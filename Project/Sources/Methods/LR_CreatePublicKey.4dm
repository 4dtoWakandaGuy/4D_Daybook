//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_CreatePublicKey
	//------------------ Method Notes ------------------
	//This method generates and encryption key pair for Daybook.
	//The Private key is then stored in the data structure'
	//the public key is picked up and stored in the licence numberer
	//that public key is then used to ensure that any licence generated with the
	//licence number CAN only be read by daybook
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2012 11:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($PKprivKey; $PKpubKey)
	C_TEXT:C284(<>LR_T_PrivateKEYTEXT; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_CreatePublicKey")
If (Count parameters:C259=0) & (False:C215)
	GENERATE ENCRYPTION KEYPAIR:C688($PKprivKey; $PKpubKey; 2048)
	CLEAR PASTEBOARD:C402
	APPEND DATA TO PASTEBOARD:C403("com.4d.private.text.native"; $PKprivKey)
	BLOB TO DOCUMENT:C526("DBPublicKey.txt"; $PKpubKey)
	BLOB TO DOCUMENT:C526("DBPrivateKey.txt"; $PKprivKey)
End if 
//DOCUMENT TO BLOB("DBPrivateKey.txt";$PKprivKey)
//CLEAR PASTEBOARD
//APPEND DATA TO PASTEBOARD("com.4d.private.text.native";$PKprivKey)
//TRACE
//ALERT("PUT IT INT")
<>LR_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEApFtVnvcpGM41bD/TF9AqtH1kAMfpta1YVp/mq52772QmEwp0"+Char:C90(10)+"KVNg69Fzl6j4X7uDRiB6QzVo+8xh6aWckNCFffAvBEU2SYW92vJvNqsiBk2UJRMA"+Char:C90(10)+"rgtdxHnSqlfziNWDiYz8nm3aLVqNf5bOk+c5g1JDOpaAkVRYrktRfrfl36LbDTzW"+Char:C90(10)+"xfTgrg99Nasa83DqwKFAHD3egtk6V90dspAcsiTpi98YH+0pO9YqG9xvMMEs2Sa8"+Char:C90(10)+"fm9SJLO4oDPQve77/Id5Q5UA8dgbC5t8hdR6BC3vjx1DDfWxDjiAO8KLBX9cJPEp"+Char:C90(10)+"J9AOFjvNOYgbh2yb3L0vHNkGvaUnfFWsMJ1IoQIDAQABAoIBAErN1xZW37mOgPoX"+Char:C90(10)+"wnfgIs+rEkzYsCIkF0S12kLZs6OtLTcVVvFIJaCu37FzEjhgG8tbFMpqELIpv5ab"+Char:C90(10)+"7bprbZZ4Lq3+4kpsOJDiLoPvN7kurfKBx5lvSuoVmDA3f3wT0Z5VMNTaoqZpxGUB"+Char:C90(10)+"ulvOrXp7gmW0Aigi/4m0dg76nAFAXwtAVc+GDxLjCaggr1zTrhShYBA2WND9JtXd"+Char:C90(10)+"jzbAwNN1ABnV9irfLrG0yK30syG4vsheIkal6FlyR3O3JPb7IcQg5n0aHdIXdHmc"+Char:C90(10)+"+/ikvv82QtiMdKXAU+WH7A7qlMdraYHdbZwN4iii+CNq7uCvEzp5I0vCfutXTjgk"+Char:C90(10)+"ZyZQVxECgYEA1zs9PXCxxGg0tV49qtAVZuEtN8NfRyMhyNmbZPvRCvZ0y3RfsME2"+Char:C90(10)+"n0xC29cYO9iEeb4YbK9+X2klVkc6JKDAdL38XbGHCvQ3FV67IsKIcfvnGQzB1HTv"+Char:C90(10)+"CekLa2cIHrgwie9jsOBkA6dRJYQWmabbMOA13eWRmyPZ7uSBO9QL358CgYEAw30j"+Char:C90(10)+"vU/xLSe6m82WxqMbtGm9Y+Rd2CkdXv9nRPv0zLGCs9mVK0j4cHSKZMzOFAyTEeqB"+Char:C90(10)+"VFVO0MBXAH1PAuHkilcinlnrZlE2RIZPoqqJ7oZ/dwwYgySARUEE+FjO2iQtwNPB"+Char:C90(10)+"UBmYerShqZxbI4HEBXV4eLAbE7vu6Tn7pmiE778CgYB323VvEaLtTVqM5b5RsS85"+Char:C90(10)+"64vS0entI5Nc1lHDGrh+8mB4LIZdWDui2kUhR9cm/JxJb6MKY3BskZFJSsEGRL7o"+Char:C90(10)+"RCSVyJb7cqR6MhbkdJCnaTB4srH+LmAvlKfXV7kd4lSle7p4dX08y6BU1AoB5vmJ"+Char:C90(10)+"blKRD5bWXlCuyHFvb9Zs4QKBgQDBtUKw2II3KGL09+crtXxCbXTJgwSqqTL9az89"+Char:C90(10)+"UBzmqA7HgBcb6Rak+BYahAbAPyWMXz7//fg3Sh/r0D92r7fyjR00pA1qOZb4l85Z"+Char:C90(10)+"dXtv675qjIXNjWG9PgxaukVeSvM7W5j2ciZxkIOQueplaLSAZEKX9IkgKN04JciC"+Char:C90(10)+"wJbZqQKBgBUKJ92NQ3uWCAzfgvH+C9XnXDUAiBTnSzZOQsF9T/dXrmSonEsopIEx"+Char:C90(10)+"Rkp45pxdRG9XTHFrFRmzKwUaQ421Z2wgBV5iw5e5iFft2I8MOpepa9rf05Co0Wl2"+Char:C90(10)+"v2QkhqJoY6O4iNlz9+aw00Sj4LDISGmpKydPgumdM40xdQm7nx2e"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"
ERR_MethodTrackerReturn("LR_CreatePublicKey"; $_t_oldMethodName)