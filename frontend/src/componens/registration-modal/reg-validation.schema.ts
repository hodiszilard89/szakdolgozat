import * as Yup from "yup";

let helper = "";
const isNameAvailable = async (email: string | undefined) => {
  try {
    const response = await fetch(
      `http://localhost:8080/users/checkemail/${email}`,
      {
        method:"GET"
      }
    ) ;
    if (!response.ok) {
      throw new Error("Hiba történt a szerverrel való kommunikáció során.");
    }
    const data = await response.json();
    console.log(data)
    return data;
  } catch (error) {
    console.error("Hiba:", error);
    return false;
  }
};

let isAvailable = false;
export const RegValidationSchema = Yup.object({
  email: Yup.string()
    .email("Érvénytelen e-mail cím formátum.")
    .test("unique-email", "ez az email cím már foglalt", async (email) => {
      if (helper !== email) 
        isAvailable = await isNameAvailable(email);     
        helper = email ? email : "";
      return isAvailable;
    })
    .required("az e-mail megadás kötelező"),
  password: Yup.string()
    .min(6, "A jelszó legalább 6 karakterből kell álljon.")
    .required("A jelszó megadása kötelező."),
  confirmpassword: Yup.string()
    .oneOf([Yup.ref("password")], "A jelszavak nem egyeznek meg.")
    .required("A jelszó megerősítése kötelező."),
  chatname: Yup.string()
    .min(6, "A név legalább 6 karakterből kell álljon.")
    .required("A chat név megadása kötelező."),
  firstname: Yup.string()
    .min(3, "A név legalább 6 karakterből kell álljon.")
    .required("A név megadása kötelező."),
  secname: Yup.string()
    .min(3, "A név legalább 6 karakterből kell álljon.")
    .required("A név megadása kötelező."),
});
