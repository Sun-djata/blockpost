import { useAccount } from '@micro-stacks/react';

export const UserCard = () => {
  const { stxAddress } = useAccount();
  if (!stxAddress) return <h2>No active session</h2>;
  return (<div><h2>Connected Wallet:</h2> <h3>{stxAddress}</h3></div>);
};
