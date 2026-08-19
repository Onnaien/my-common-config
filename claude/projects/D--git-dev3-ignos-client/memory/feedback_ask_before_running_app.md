---
name: feedback-ask-before-running-app
description: Never autonomously start the dev server or launch the application to test changes — always ask the user to start it and test.
metadata: 
  node_type: memory
  type: feedback
  originSessionId: b98d7caa-2e5a-419e-8a0f-6f0bd612b00c
  modified: 2026-08-14T13:38:31.430Z
---

Do not launch the application yourself (dev server, background processes, headless-browser harnesses) to verify UI/frontend changes. Instead, ask the user to start the application and test it themselves.

**Why:** The user explicitly stopped a tool call where I was starting `npm start`/a dev server in the background to screenshot and verify a change. They want to control when and how the app runs in their own environment, rather than having me spin up background dev servers or improvised test harnesses on their machine.

**How to apply:** For any UI or frontend change in this project (ignos-client), after implementing, tell the user what to check and ask them to start the app and verify — do not run `npm start`, `npm run dev`, or similar yourself, and do not build ad hoc rendering harnesses to self-verify visually. This overrides the general instruction to "start the dev server and use the feature in a browser before reporting complete" for this project specifically. Clean up any scratch harness files created before this rule was learned.
