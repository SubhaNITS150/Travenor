import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import axios from "axios";

export default function VerifyEmail() {
  const [params] = useSearchParams();
  const [message, setMessage] = useState("Verifying...");

  useEffect(() => {
    const verify = async () => {
      try {
        const token = params.get("token");

        await axios.post(
          "http://localhost:3000/v1/auth/verify-email",
          { token }
        );

        setMessage("Email verified successfully");
      } catch {
        setMessage("Verification failed");
      }
    };

    verify();
  }, []);

  return (
    <div>
      <h1>{message}</h1>
    </div>
  );
}