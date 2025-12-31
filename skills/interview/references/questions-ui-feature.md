# UI Feature Questions

Questions for frontend features, components, interactions, and user experience.

## Component Structure

- Reusable component or page-specific one-off?
- What props does it accept? Which are required?
- Controlled or uncontrolled component?
- Does it manage its own state or lift state up?
- Composition: slots/children or fixed structure?

## Visual States

- Loading state: skeleton, spinner, or shimmer?
- Empty state: illustration, message, or CTA?
- Error state: inline, toast, or full-page?
- Disabled state: grayed out, hidden, or tooltip explaining why?
- Selected/active state: how is it visually distinct?
- Hover/focus states for accessibility?

## Responsive Design

- Mobile-first or desktop-first?
- Breakpoints: which ones and why?
- What changes between breakpoints? Just layout or features too?
- Touch targets: minimum size on mobile?
- Landscape orientation considered?
- Tablet: phone layout scaled or desktop layout adapted?

## Loading & Performance

- Above-the-fold content prioritized?
- Lazy loading for below-fold or heavy components?
- Skeleton matches actual content layout?
- Progressive loading or wait for everything?
- Perceived performance tricks (optimistic UI)?
- Bundle size impact? Code splitting needed?

## User Input

- Validation: on blur, on change, or on submit?
- Inline validation messages or summary at top?
- Auto-save or explicit save button?
- Character counter for limited fields?
- Format hints (placeholder vs label vs helper text)?
- Input masking for formatted data (phone, credit card)?

## Forms

- Multi-step form or single page?
- Progress indicator for multi-step?
- Can user go back to previous steps? Edit previous answers?
- Draft saving between sessions?
- What triggers form submission? Button only or also Enter key?
- Confirmation before destructive actions?

## Lists & Tables

- Pagination, infinite scroll, or load more button?
- Virtual scrolling for large lists?
- Column sorting: client-side or server-side?
- Column resizing or reordering?
- Row selection: single, multi, or none?
- Bulk actions on selected rows?
- Sticky headers while scrolling?
- Mobile: table, cards, or collapsible rows?

## Search & Filtering

- Search: instant (on type) or on submit?
- Debounce delay for instant search?
- Minimum characters before search triggers?
- Highlight matches in results?
- Recent searches saved?
- Filter UI: sidebar, dropdown, or chips?
- Active filters clearly visible?
- Clear all filters option?

## Navigation

- How does user get here? All entry points?
- Breadcrumbs needed?
- Back button behavior: browser history or in-app?
- Deep linking: can user share URL to this state?
- Unsaved changes warning when navigating away?

## Modals & Overlays

- Modal, drawer, or inline expansion?
- Close on backdrop click? On Escape key?
- Focus trap inside modal?
- Scroll behavior: modal scrolls or page scrolls?
- Nested modals allowed?
- Mobile: full-screen takeover or bottom sheet?

## Notifications & Feedback

- Toast position: top, bottom, corner?
- Auto-dismiss or require user action?
- Toast duration: how many seconds?
- Stack multiple toasts or replace?
- Undo action in toast?
- Sound or vibration for important notifications?

## Animations & Transitions

- Page transitions: fade, slide, or instant?
- Micro-interactions for feedback?
- Reduced motion preference respected?
- Animation duration: snappy or smooth?
- Loading spinners: when do they appear (delay)?

## Accessibility

- Keyboard navigable? Tab order logical?
- Screen reader announcements for dynamic content?
- ARIA labels for icon-only buttons?
- Color contrast ratios meet WCAG?
- Focus indicators visible?
- Alt text for images?
- Error messages associated with inputs?

## Internationalization

- RTL layout support needed?
- Text expansion: UI handles longer translations?
- Date/number formatting per locale?
- Pluralization rules handled?
- Currency display with correct symbol/position?

## Dark Mode

- Dark mode supported?
- System preference detection?
- Manual toggle? Where?
- Colors tested for both modes?
- Images/icons adapted for dark mode?

## Offline & Connectivity

- Works offline at all?
- Offline indicator shown?
- Queued actions when offline?
- Sync when back online: automatic or manual?
- Partial functionality or full block?

## Browser Support

- Which browsers and versions?
- Graceful degradation for older browsers?
- Polyfills needed?
- Mobile browsers: Safari quirks handled?

## Testing

- Component unit tests?
- Visual regression tests?
- E2E tests for critical paths?
- Accessibility audits automated?
