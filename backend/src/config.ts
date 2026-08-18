export const RPC_URLS = [
  process.env.RPC_URL,
  "https://bnb-testnet.api.onfinality.io/public",
  "https://bsc-testnet-rpc.publicnode.com",
  "https://data-seed-prebsc-1-s1.bnbchain.org:8545",
].filter(Boolean) as string[];

export const CONTRACTS = {
  rewardToken: "0xF63fCaFDA48e8A8b573320032B5c46451f92f616",
  escrowFactory: "0x0C8ed1eAE0AbcA7CE636cf11FCe56e32843eB094",
} as const;

export const DEPLOY_BLOCK = 125_028_961n;
export const CHUNK = 9000n;
export const PORT = Number(process.env.PORT ?? 3000);

// dua wallet, dua peran
export const RELAYER_PK = process.env.RELAYER_PK as `0x${string}` | undefined; // panitia
export const ORACLE_PK = process.env.ORACLE_PK as `0x${string}` | undefined;   // juri

export const LLM = {
  baseUrl: (process.env.LLM_BASE_URL ?? "https://api.openai.com/v1").replace(/\/$/, ""),
  apiKey: process.env.LLM_API_KEY,
  model: process.env.LLM_MODEL ?? "gpt-4o-mini",
} as const;

export const POLL_INTERVAL_MS = Number(process.env.POLL_INTERVAL_SECONDS ?? 15) * 1000;