import { useSearchParams } from "react-router-dom";
import { useState } from "react";
import axios from "axios";

export default function ResetPassword() {
  const [params] = useSearchParams();

  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");

  const handleSubmit = async () => {
    try {
      const token = params.get("token");

      await axios.post(
        `http://localhost:3000/v1/auth/reset-password?token=${token}`,
        {
          password,
        }
      );

      setMessage("Password updated successfully");
    } catch {
      setMessage("Password reset failed");
    }
  };

  return (
    <div>
      <h1>Reset Password</h1>

      <input
        type="password"
        placeholder="New Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />

      <button onClick={handleSubmit}>
        Reset Password
      </button>

      <p>{message}</p>
    </div>
  );
}